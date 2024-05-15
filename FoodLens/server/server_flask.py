from flask import Flask, request, jsonify
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Cấu hình kết nối MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '123'
app.config['MYSQL_DB'] = 'db_mobile'
app.config['MYSQL_PORT'] = 3306

mysql = MySQL(app)


# API to Select User by Email
@app.route('/user', methods=['GET'])
def get_user_by_email():
    email = request.args.get('email')
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM user WHERE email = %s", [email])
    user = cur.fetchone()
    cur.close()
    return jsonify(user), 200 if user else 404


# API to Insert New User
@app.route('/user/register', methods=['POST'])
def insert_user():
    email = request.json['email']
    password = request.json['password']

    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO user(userName, email, pass) VALUES (%s, %s, %s)", 
                ('New User', email, password))
    mysql.connection.commit()
    cur.close()
    return jsonify({'message': 'User registered successfully'}), 201


# API to Fetch and Set Global Username
@app.route('/user/username', methods=['GET'])
def fetch_username():
    email = request.args.get('email')
    cur = mysql.connection.cursor()
    cur.execute("SELECT userName FROM user WHERE email = %s", [email])
    result = cur.fetchone()
    cur.close()
    if result:
        return jsonify({'userName': result[0]}), 200
    else:
        return jsonify({'error': 'No user found with that email'}), 404


# API to Select User by Email and Password
@app.route('/user/login', methods=['POST'])
def login_user():
    email = request.json['email']
    password = request.json['password']

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM user WHERE email = %s AND pass = %s", [email, password])
    user = cur.fetchone()
    cur.close()
    return jsonify(user), 200 if user else 401


# API to Update User Password
@app.route('/user/update_password', methods=['POST'])
def update_password():
    email = request.json['email']
    new_password = request.json['newPassword']

    cur = mysql.connection.cursor()
    cur.execute("UPDATE user SET pass = %s WHERE email = %s", [new_password, email])
    mysql.connection.commit()
    cur.close()
    return jsonify({'message': 'Password updated successfully'}), 200


# API to select descIngredient
@app.route('/ingredient/description', methods=['GET'])
def fetch_ingredient_description():
    name_ingredient = request.args.get('nameIngredient')
    if not name_ingredient:
        return jsonify({'error': 'Missing ingredient name'}), 400

    cur = mysql.connection.cursor()
    try:
        cur.execute("SELECT descIngredient FROM ingredientDetail WHERE nameIngredient = %s", [name_ingredient])
        result = cur.fetchone()
        if result:
            return jsonify({'descIngredient': result[0]}), 200
        else:
            return jsonify({'descIngredient': 'No description available'}), 404
    except Exception as e:
        print(f"Error fetching ingredient description: {e}")
        return jsonify({'error': 'Error retrieving data'}), 500
    finally:
        cur.close()


# API to get food names
@app.route('/food/names', methods=['GET'])
def get_food_names():
    name_ingredient = request.args.get('nameIngredient')
    if not name_ingredient:
        return jsonify({'error': 'Missing ingredient name'}), 400

    cur = mysql.connection.cursor()
    try:
        query = """
        SELECT fd.foodName 
        FROM foodDetail fd 
        JOIN ingredientDetail id ON fd.idIngredient = id.idIngredient 
        WHERE id.nameIngredient = %s
        """
        cur.execute(query, [name_ingredient])
        results = cur.fetchall()
        if results:
            food_names = [result[0] for result in results]
            return jsonify({'foodNames': food_names}), 200
        else:
            return jsonify({'message': 'No foods found'}), 404
    except Exception as e:
        print(f"Error fetching food names: {e}")
        return jsonify({'error': 'Error retrieving data'}), 500
    finally:
        cur.close()


# API to get food detail
@app.route('/food/details', methods=['GET'])
def get_food_details():
    food_name = request.args.get('foodName')
    if not food_name:
        return jsonify({'error': 'Missing food name'}), 400

    cur = mysql.connection.cursor()
    try:
        query = """
        SELECT foodName, foodDetail, foodIngredient, foodProcessing
        FROM foodDetail
        WHERE foodName = %s
        """
        cur.execute(query, [food_name])
        results = cur.fetchall()
        if results:
            food_details = [{
                'foodName': result[0],
                'foodDetail': result[1],
                'foodIngredient': result[2],
                'foodProcessing': result[3]
            } for result in results]
            return jsonify(food_details), 200
        else:
            return jsonify({'message': 'No food found'}), 404
    except Exception as e:
        print(f"Error fetching food details: {e}")
        return jsonify({'error': 'Error retrieving data'}), 500
    finally:
        cur.close()


# API để cập nhật tên người dùng dựa trên email
@app.route('/user/update_username', methods=['POST'])
def update_username():
    email = request.json['email']
    new_username = request.json['newUsername']

    cur = mysql.connection.cursor()
    try:
        cur.execute("UPDATE user SET userName = %s WHERE email = %s", (new_username, email))
        mysql.connection.commit()
        return jsonify({'message': 'Username updated successfully'}), 200
    except Exception as e:
        print(f"Error updating username: {e}")
        return jsonify({'error': 'Failed to update username'}), 500
    finally:
        cur.close()


# API Kiểm Tra Món Ăn Đã Tồn Tại Trong Danh Sách Yêu Thích
@app.route('/check_favorite', methods=['POST'])
def check_favorite():
    try:
        email = request.json['email']
        foodName = request.json['foodName']
        # print(email)
        # print(foodName)

        cur = mysql.connection.cursor()
        cur.execute("SELECT idUser FROM user WHERE email = %s", [email])
        user = cur.fetchone()

        cur.execute("SELECT idFood FROM foodDetail WHERE foodName = %s", [foodName])
        food = cur.fetchone()
        cur.close()

        if user and food:
            id_user = user[0]
            id_food = food[0]
            # print(id_user)
            # print(id_food)
            
            cur = mysql.connection.cursor()
            cur.execute("SELECT id FROM foodUser WHERE idUser = %s AND idFood = %s", (id_user, id_food))
            existing_favorite = cur.fetchone()
            cur.close()

            if existing_favorite:
                return jsonify({'message': 'Favorite already exists'}), 200
            else:
                return jsonify({'message': 'Favorite does not exist'}), 203
        else:
            return jsonify({'error': 'User or food not found'}), 404
    except Exception as e:
        print(f"Error checking favorite: {e}")
        return jsonify({'error': 'Failed to check favorite'}), 500


# API để thêm dữ liệu vào bảng foodUser khi người dùng bấm vào nút yêu thích
@app.route('/add_favorite', methods=['POST'])
def add_favorite():
    try:
        email = request.json['email']
        foodName = request.json['foodName']

        cur = mysql.connection.cursor()
        cur.execute("SELECT idUser FROM user WHERE email = %s", [email])
        user = cur.fetchone()
        cur.execute("SELECT idFood FROM foodDetail WHERE foodName = %s", [foodName])
        food = cur.fetchone()

        if user and food:
            id_user = user[0]
            id_food = food[0]

            cur.execute("SELECT * FROM foodUser WHERE idUser = %s AND idFood = %s", (id_user, id_food))
            exists = cur.fetchone()

            if exists:
                cur.close()
                return jsonify({'message': 'Favorite already exists'}), 409
            
            cur.execute("INSERT INTO foodUser (idUser, idFood, favourite) VALUES (%s, %s, %s)", (id_user, id_food, 1))
            mysql.connection.commit()
            cur.close()
            return jsonify({'message': 'Favorite added successfully'}), 200
        
        else:
            cur.close()
            return jsonify({'error': 'User or food not found'}), 404
        
    except Exception as e:
        cur.close()
        print(f"Error adding favorite: {e}")
        return jsonify({'error': 'Failed to add favorite'}), 500



# API to delete favourite
@app.route('/delete_favorite', methods=['POST'])
def delete_favorite():
    try:
        email = request.json['email']
        foodName = request.json['foodName']

        cur = mysql.connection.cursor()
        cur.execute("SELECT idUser FROM user WHERE email = %s", [email])
        user = cur.fetchone()
        
        cur.execute("SELECT idFood FROM foodDetail WHERE foodName = %s", [foodName])
        food = cur.fetchone()

        if user and food:
            id_user = user[0]
            id_food = food[0]

            cur.execute("SELECT id FROM foodUser WHERE idUser = %s AND idFood = %s", (id_user, id_food))
            favorite = cur.fetchone()

            if favorite:
                cur.execute("DELETE FROM foodUser WHERE idUser = %s AND idFood = %s", (id_user, id_food))
                mysql.connection.commit()
                response_message = 'Favorite deleted successfully'
                status_code = 200
            else:
                response_message = 'Favorite does not exist'
                status_code = 203

        else:
            response_message = 'User or food not found'
            status_code = 404

        cur.close()
        return jsonify({'message': response_message}), status_code

    except Exception as e:
        print(f"Error deleting favorite: {e}")
        cur.close()
        return jsonify({'error': 'Failed to delete favorite'}), 500


# API to get user favorites with food names
@app.route('/get_user_favorites', methods=['POST'])
def get_user_favorites():
    try:
        email = request.json.get('email')
        if not email:
            return jsonify({'error': 'Missing email'}), 400
        
        cur = mysql.connection.cursor()
        
        cur.execute("SELECT idUser FROM user WHERE email = %s", [email])
        user = cur.fetchone()
        
        if not user:
            return jsonify({'error': 'User not found'}), 404
        
        cur.execute("""
            SELECT fu.idFood, fd.foodName, fu.favourite 
            FROM foodUser AS fu
            JOIN foodDetail AS fd ON fu.idFood = fd.idFood
            WHERE fu.idUser = %s
        """, [user[0]])
        
        favorites = cur.fetchall()
        
        favorites_list = []
        for favorite in favorites:
            favorites_list.append({
                'idFood': favorite[0],
                'foodName': favorite[1],
                'favourite': favorite[2]
            })
        
        return jsonify(favorites_list), 200

    except Exception as e:
        print(f"Error retrieving user favorites with food names: {e}")
        return jsonify({'error': 'Failed to retrieve user favorites'}), 500

    finally:
        cur.close()


# API to change pass
@app.route('/change_password', methods=['POST'])
def change_password():
    email = request.json.get('email')
    old_password = request.json.get('old_password')
    new_password = request.json.get('new_password')

    if not email or not old_password or not new_password:
        return jsonify({'error': 'Missing data'}), 400

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT pass FROM user WHERE email = %s", [email])
    user = cursor.fetchone()

    if user and user[0] == old_password:
        if user[0] == new_password:
            cursor.close()
            return jsonify({'message': 'Password is duplicated'}), 203
        else:
            cursor.execute("UPDATE user SET pass = %s WHERE email = %s", (new_password, email))
            mysql.connection.commit()
            cursor.close()
            return jsonify({'message': 'Password updated successfully'}), 200
    else:
        cursor.close()
        return jsonify({'error': 'Invalid email or password'}), 401


# API to get ingredient name
@app.route('/get_ingredient_name_by_food', methods=['GET'])
def get_ingredient_name_by_food():
    food_name = request.args.get('foodName')
    if not food_name:
        return jsonify({'error': 'Missing food name'}), 400
    
    cur = mysql.connection.cursor()
    try:
        cur.execute("""
            SELECT idIngredient
            FROM foodDetail
            WHERE foodName = %s
        """, [food_name])
        
        food_detail = cur.fetchone()
        if not food_detail:
            return jsonify({'error': 'Food not found'}), 404
        
        id_ingredient = food_detail[0]

        cur.execute("""
            SELECT nameIngredient
            FROM ingredientDetail
            WHERE idIngredient = %s
        """, [id_ingredient])
        
        ingredient_detail = cur.fetchone()
        if not ingredient_detail:
            return jsonify({'error': 'Ingredient not found'}), 404
        
        name_ingredient = ingredient_detail[0]
        return jsonify({'nameIngredient': name_ingredient}), 200
    
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({'error': 'Error retrieving ingredient name'}), 500
    
    finally:
        cur.close()


if __name__ == '__main__':
    app.run(host='192.168.1.8', port=8080)


