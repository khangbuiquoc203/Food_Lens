-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_mobile
CREATE DATABASE IF NOT EXISTS DB_Mobile;
USE DB_Mobile;
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fooddetail`
--

DROP TABLE IF EXISTS `fooddetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fooddetail` (
  `idFood` int NOT NULL AUTO_INCREMENT,
  `idIngredient` int DEFAULT NULL,
  `foodName` text,
  `foodDetail` text,
  `foodIngredient` text,
  `foodProcessing` text,
  PRIMARY KEY (`idFood`),
  KEY `idIngredient` (`idIngredient`),
  CONSTRAINT `fooddetail_ibfk_1` FOREIGN KEY (`idIngredient`) REFERENCES `ingredientdetail` (`idIngredient`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooddetail`
--

LOCK TABLES `fooddetail` WRITE;
/*!40000 ALTER TABLE `fooddetail` DISABLE KEYS */;
INSERT INTO `fooddetail` VALUES 
(1,1,'Apple and walnut salad','This quick and easy salad with apples and walnuts makes a delicious lunch or side salad. We love the light dressing! Feel free to add spinach or other baby lettuces to the mix.',
'     • 1 head butter lettuce 
**     • 1/4-1/2 cup walnuts, roughly chopped 
**     • 1 apple, peeled, cored and diced (we used Pink Lady) 
**     • 1/4 cup dried cherries 
**     • 1/4 cup apple juice (we used Solana Gold) 
**     • 1 tablespoon apple cider vinegar (we used Solana Gold) 
**     • 1/2 tablespoon honey 
**     • 1 tablespoon olive oil salt and pepper to taste',
'Step 1: Cut the bottom off the lettuce and compost. Tear the lettuce into bite-sized pieces and put in a salad bowl, along with the walnuts, apple and cherries.  **Step 2: To make the dressing: in a small bowl, whisk the apple juice, apple cider vinegar, honey and olive oil until combined. **Step 3: Season with salt and pepper to taste.  Drizzle the dressing over the salad and toss gently to combine. You can also add other salad favorites like avocado, feta cheese or some diced chicken if desired.'),
(2,2,'Red bean sweet soup with tapioca and coconut milk','Sweet soup has become very popular in Vietnam; you can easily find it almost everywhere included restaurants, food shops, on the street, etc. Red Bean Sweet Soup with Tapioca and Coconut Milk  is one of our stunning Vietnamese Recipes.',
'     • 200g of red bean 
**     • 20g of tapioca (it looks like small pearl beads) 
**     • Sugar (as much as you like) 
**     • 150ml of coconut milk and ½ spoon of salt
**     • 1 spoon of sugar and 1 spoon of corn powder (or flour) Roasted peanuts, mash it into small pieces (as much as you like)','Step 1: Red bean need to be screened first to pick out the floaters. Soak it in cold water let it rest overnight. **Step 2: Add red bean into a pot, pour water to cover all beans. Cook until beans become soft. Add more sugar and cook with small heat. **Step 3: Tapioca is doused in cold water, soak from 15 – 20 mins until it is all expanded. **Step 4: Pour out the water from the tapioca. Add the tapioca slowly into the sweet soup. Use the tablespoon to stir it gently. When you see the tapioca float on the surface means it is cooked. Now you can adjust the sweetness according to your taste. **Step 5: Add coconut milk, sugar & corn powder (or flour) into the sweet soup. Cook with small heat until the coconut milk looks gelatinous. Finish this step and we are almost complete one dish in many stunning Vietnamese Recipes.'),
(3,3,'Beetroot salad','Beetroot salad is a vibrant and flavorful dish that celebrates the earthy sweetness of beetroots. This salad typically features grated or thinly sliced beetroot combined with various ingredients to create a refreshing and nutritious dish',
'     • 2 medium-sized beetroot 
**     • Peeled and grated 1/4 cup walnuts 
**     • Chopped 2 tablespoons feta cheese 
**     • Crumbled 2 tablespoons extra virgin olive oil 
**     • 1 tablespoon balsamic vinegar 
**     • Salt and pepper to taste Fresh herbs (such as parsley or dill) for garnish (optional)','Step 1: Prepare the beetroot: **     • Peel the beetroot using a vegetable peeler. **     • Grate the beetroot using a box grater or a food processor. **Step 2: Toast the walnuts (Optional): **     • Place the chopped walnuts in a dry skillet over medium heat. **     • Toast the walnuts, stirring frequently, until fragrant and lightly golden. Be careful not to burn them. Remove from heat and let cool. **Step 3: Assemble the salad: **     • In a large mixing bowl, combine the grated beetroot, toasted walnuts, and crumbled feta cheese. **Step 4: Prepare the dressing: **     • In a small bowl, whisk together the extra virgin olive oil and balsamic vinegar to make the dressing. **     • Season the dressing with salt and pepper to taste. **Step 5: Dress the salad: **     • Pour the dressing over the beetroot mixture in the bowl. **     • Toss the salad gently until all the ingredients are evenly coated with the dressing. **Step 6: Garnish and serve: **     • Garnish the salad with fresh herbs, such as chopped parsley or dill, if desired. **     • Serve the beetroot salad immediately as a side dish or a light meal  '),
(4,4,'Philly Cheesesteak Stuffed Peppers',' Philly Cheesesteak Stuffed Peppers offer a delightful twist on the classic Philly cheesesteak sandwich, transforming it into a flavorful and wholesome dish. In this dish, bell peppers serve as the perfect vessel for a savory filling of thinly sliced beef steak, onions, and melted cheese',
'     • 4 large bell peppers 500g beef steak 
**     • Thinly sliced 1 onion, sliced 2 cloves garlic 
**     • Minced 1/2 teaspoon black pepper 1/2 teaspoon onion powder 1/2 teaspoon salt 200g Provolone or Mozzarella cheese 
**     • Shredded Olive oil or cooking oil, for cooking','Step 1: Prepare the Bell Peppers: **     • Wash the bell peppers and cut off the tops of each pepper. Remove the seeds and membranes to create space for the filling. **Step 2: Prepare the Filling: **     • In a large skillet, heat olive oil or cooking oil over medium heat. **     • Once the oil is hot, add the sliced onion and minced garlic to the skillet. Sauté until the onion becomes soft and fragrant. **     • Add the beef steak to the skillet and cook until the meat is browned and no longer pink. Season with black pepper, onion powder, and salt. **     • Once the steak is cooked, remove from heat and set aside. **Step 3: Stuff and Bake the Bell Peppers: **     • Place the bell peppers on a greased baking sheet or use parchment paper to prevent sticking. **     • Stuff each bell pepper with the beef and onion mixture, then top with a layer of shredded cheese. **     • Bake the stuffed peppers in a preheated oven at 180°C (350°F) for about 15-20 minutes or until the cheese is melted and the peppers are tender. **Step 4: Serve: **     • Once the stuffed peppers are cooked, remove them from the oven and transfer to a serving plate. **     • Serve immediately while still hot, optionally garnish with additional cheese sauce if desired.  '),
(5,5,'Cabbage rolls','Cabbage rolls, also known as stuffed cabbage or golabki, are a classic dish enjoyed in various cuisines around the world',
'     • 12 leaves cabbage 
**     • 1 pound extra-lean ground beef  
**     • 1 cup cooked white rice 
**     • 1 egg, beaten 
**     • ¼ cup milk 
**     • ¼ cup minced onion 
**     • 1 ¼ teaspoons salt 
**     • 1 ¼ teaspoons ground black pepper 
**     • 1 (8 ounce) can tomato sauce 
**     • 1 tablespoon brown sugar 
**     • 1 tablespoon lemon juice 
**     • 1 teaspoon Worcestershire sauce', 'Step 1: Prepare the Cabbage Leaves:				
**     • Bring a large pot of salted water to a boil.			
**     • Carefully remove the core from the cabbage head and place the whole head in the boiling water.
**     • Cook for 5-7 minutes until the outer leaves are softened and can be easily peeled off. Remove the cabbage head from the pot and let it cool slightly.
**     • Gently peel off 12-14 large cabbage leaves, trimming off the thick center vein if necessary. Set aside.
**Step 2: Prepare the Filling:					
**     • In a large mixing bowl, combine the ground meat, cooked rice, chopped onion, minced garlic, beaten egg, dried oregano, dried thyme, salt, and pepper. Mix until well combined.
**Step 3: Assemble the Cabbage Rolls:				
**     • Place a cabbage leaf on a clean surface and spoon some of the meat mixture onto the center of the leaf.
**     • Fold the sides of the cabbage leaf over the filling, then roll it up tightly to encase the filling. Repeat with the remaining cabbage leaves and filling.
**Step 4: Cook the Cabbage Rolls:				
**     • Preheat the oven to 180°C (350°F).				
**     • In a large ovenproof dish, spread a thin layer of crushed tomatoes over the bottom.
**     • Arrange the cabbage rolls seam side down in the dish, packing them snugly together.
**     • Pour the remaining crushed tomatoes and beef or vegetable broth over the cabbage rolls.
**     • Drizzle with olive oil and season with salt and pepper.		
**     • Cover the dish with foil and bake in the preheated oven for 1 to 1.5 hours, until the cabbage rolls are tender and the filling is cooked through.
**Step 5. Serve:						
**     • Once cooked, remove the cabbage rolls from the oven and let them cool slightly.
**     • Serve the cabbage rolls hot, garnished with fresh parsley if desired.'),
(6,6,'Carrot cake','Carrot cake is a delightful and flavorful dessert that combines the natural sweetness of carrots with warm spices and a moist, tender crumb','- For the cake:
**     • 2 cups all-purpose flour
**     • 2 teaspoons baking powder
**     • 1 teaspoon baking soda
**     • 1/2 teaspoon salt
**     • 2 teaspoons ground cinnamon
**     • 1/2 teaspoon ground nutmeg
**     • 1/2 teaspoon ground ginger
**     • 3 large eggs
**     • 1 cup granulated sugar
**     • 1 cup packed light brown sugar
**     • 1 cup vegetable oil or melted coconut oil
**     • 2 teaspoons vanilla extract
**     • 2 cups grated carrots (about 3-4 medium carrots)
**     • 1/2 cup crushed pineapple, drained (optional)
**     • 1/2 cup chopped walnuts or pecans (optional)
**     • 1/2 cup shredded coconut (optional)
**- For the cream cheese frosting:
**     • 8 ounces cream cheese, softened
**     • 1/2 cup unsalted butter, softened
**     • 4 cups powdered sugar
**     • 1 teaspoon vanilla extract','Step 1: Preheat the oven and prepare the pan:
**     • Preheat your oven to 180°C (350°F). Grease and flour two 9-inch round cake pans or line them with parchment paper for easy removal.
**Step 2: Prepare the dry ingredients:
**     • In a large mixing bowl, whisk together the flour, baking powder, baking soda, salt, cinnamon, nutmeg, and ginger until well combined. Set aside.
**Step 3: Prepare the wet ingredients:
**     • In another mixing bowl, beat the eggs, granulated sugar, brown sugar, vegetable oil, and vanilla extract until smooth and well combined.
**Step 4: Combine the wet and dry ingredients:
**     • Gradually add the wet ingredients to the dry ingredients, stirring until just combined. Do not overmix.
**     • Fold in the grated carrots, crushed pineapple (if using), chopped nuts (if using), and shredded coconut (if using) until evenly distributed in the batter.
**Step 5. Bake the cake:
**     • Divide the batter evenly between the prepared cake pans.
**     • Bake in the preheated oven for 25-30 minutes, or until a toothpick inserted into the center of the cakes comes out clean.
**     • Remove the cakes from the oven and let them cool in the pans for 10 minutes before transferring them to a wire rack to cool completely.
**Step 6: Prepare the cream cheese frosting:
**     • In a large mixing bowl, beat the softened cream cheese and butter until smooth and creamy.
**     • Gradually add the powdered sugar, one cup at a time, beating well after each addition.
**     • Add the vanilla extract and beat until smooth and fluffy.
**Step 7: Assemble the cake:
**     • Once the cakes have cooled completely, place one cake layer on a serving plate or cake stand.
**     • Spread a layer of cream cheese frosting over the top of the cake layer.
**     • Place the second cake layer on top and frost the top and sides of the cake with the remaining cream cheese frosting.
**Step 8. Decorate and serve:
**     • Garnish the cake with additional grated carrots, chopped nuts, or a sprinkle of cinnamon if desired.
**     • Slice and serve the carrot cake at room temperature. Enjoy!'),
(7,7,'Cucumber kimchi','Cucumber kimchi, also known as Oi Sobagi in Korean, is a delicious and refreshing variation of traditional kimchi','     • 2 pounds Kirby cucumbers, halved lengthwise and sliced crosswise 1/4-inch thick
**     • 1 tablespoon kosher salt, plus more to taste
**     • 1/4 cup untoasted sesame oil
**     • 1/2 small onion, thinly sliced
**     • 2 tablespoons finely chopped Thai or sweet basil
**     • 2 tablespoons gochugaru (Korean coarse red pepper powder; see Note)
**     • 1 tablespoon minced garlic
**     • 1 tablespoon minced peeled fresh ginger
**     • 1 teaspoon finely grated lime zest
**     • 1/2 teaspoon Asian fish sauce','Step 1: Prepare the Cucumbers:
**     • Wash the cucumbers thoroughly under cold water and pat them dry.
**     • Trim off both ends of each cucumber.
**     • Cut each cucumber lengthwise into quarters, leaving them attached at the stem end so they can be opened like a flower.
**Step 2:Salt the Cucumbers:
**     • Sprinkle coarse sea salt over the cut sides of the cucumbers, ensuring that the salt gets into the cuts.
**     • Place the salted cucumbers in a large bowl or container and let them sit at room temperature for about 30 minutes to draw out excess moisture.
**Step 3:Prepare the Brine:
**     • In a separate bowl, mix together water, rice vinegar, sugar, minced garlic, minced ginger, chopped green onions, Korean red pepper flakes, and fish sauce (if using). Stir until the sugar is dissolved.
**Step 4:Rinse and Drain the Cucumbers:
**     • After 30 minutes, rinse the salted cucumbers under cold water to remove excess salt.
**     • Gently squeeze the cucumbers to remove any excess moisture, then pat them dry with paper towels.
**Step 5:Stuff the Cucumbers:
**     • Open each cucumber quarter and fill it with the prepared brine mixture, making sure to coat the inside of the cucumber with the marinade.
**     • Close the cucumber quarters and place them in a clean, airtight container or jar.
**Step 6:Ferment the Kimchi:
**     • Seal the container or jar and let the cucumber kimchi ferment at room temperature for 1-2 days. During this time, the flavors will develop, and the cucumbers will become slightly tangy.
**     • After 1-2 days, transfer the cucumber kimchi to the refrigerator to slow down the fermentation process and prolong its shelf life. It can be enjoyed immediately or allowed to ferment further for a more intense flavor.
**Step 7: Serve:
**     • When ready to serve, garnish the cucumber kimchi with sesame seeds for extra flavor and texture.
**     • Enjoy the cucumber kimchi as a refreshing side dish or accompaniment to your favorite Korean meals.'),
(8,8,'Avocado deviled eggs',' Avocado deviled eggs are a delightful and creamy variation of traditional deviled eggs, combining the rich and buttery flavor of avocado with the classic deviled egg filling','     • 6 large eggs
**     • 1 ripe avocado
**     • 2 tablespoons mayonnaise
**     • 1 tablespoon lime juice
**     • 1 teaspoon Dijon mustard
**     • Salt and pepper to taste
**     • Paprika, for garnish
**     • Chopped fresh cilantro or parsley, for garnish (optional)','Step 1: Boil the Eggs:
**     • Place the eggs in a single layer in a saucepan and cover them with water, ensuring they are fully submerged.
**     • Bring the water to a boil over medium-high heat, then reduce the heat to low and let the eggs simmer for 10-12 minutes.
**     • Once cooked, remove the eggs from the heat and transfer them to a bowl of ice water to cool for a few minutes. This will make them easier to peel.
**Step 2:Prepare the Avocado Mixture:
**     • While the eggs are cooling, cut the avocado in half and remove the pit. Scoop the avocado flesh into a mixing bowl.
**     • Mash the avocado with a fork until smooth and creamy.
**     • Add the mayonnaise, lime juice, Dijon mustard, salt, and pepper to the mashed avocado. Stir until well combined. Adjust the seasoning to taste.
**Step 3: Assemble the Avocado Deviled Eggs:
**     • Once the eggs are cool enough to handle, carefully peel them and slice them in half lengthwise.
**     • Gently remove the yolks from the egg halves and transfer them to the bowl with the avocado mixture.
**     • Mash the egg yolks into the avocado mixture until smooth and creamy. You can also use a hand mixer for a smoother texture if desired.
**     • Taste the mixture and adjust the seasoning if necessary.
**Step 4: Fill the Egg Whites:
**     • Spoon or pipe the avocado mixture into the hollowed-out egg whites, filling them evenly.
**     • Alternatively, you can use a piping bag fitted with a star tip for a decorative presentation.
**Step 5:Garnish and Serve:
**     • Sprinkle the filled avocado deviled eggs with paprika for color and flavor.
**     • Optionally, garnish with chopped fresh cilantro or parsley for added freshness and presentation.
**     • Serve the avocado deviled eggs immediately, or refrigerate them until ready to serve. Enjoy!'),
(9,9,'Stuffed eggplant','Stuffed eggplants, also known as eggplant boats or stuffed aubergines, are a flavorful and satisfying dish that features eggplants hollowed out and filled with a delicious mixture of ingredients','     • 2 large eggplants
**     • 1 cup cooked quinoa or rice
**     • 1 onion, finely chopped
**     • 2 cloves garlic, minced
**     • 1 bell pepper, diced
**     • 1 tomato, diced
**     • 1/2 cup cooked chickpeas (optional)
**     • 1/4 cup chopped fresh parsley or basil
**     • 1/4 cup grated Parmesan cheese (optional)
**     • Salt and pepper to taste
**     • Olive oil for cooking','Step 1: Prepare the Eggplants:
**     • Preheat your oven to 200°C (400°F).
**     • Cut the eggplants in half lengthwise, then use a spoon to scoop out the flesh, leaving about a 1/2-inch border around the edges. Reserve the flesh for later use.
**     • Place the hollowed-out eggplant halves on a baking sheet lined with parchment paper.
**Step 2: Prepare the Filling:
**     • Chop the reserved eggplant flesh into small pieces.
**     • In a large skillet, heat a tablespoon of olive oil over medium heat. Add the chopped onion and cook until softened, about 3-4 minutes.
**     • Add the minced garlic and diced bell pepper to the skillet, and cook for another 2-3 minutes.
**     • Stir in the chopped eggplant flesh and diced tomato, and cook for 5-6 minutes until the vegetables are tender.
**     • Add the cooked quinoa or rice to the skillet, along with the cooked chickpeas (if using). Stir to combine.
**     • Season the filling with salt, pepper, and chopped fresh herbs, such as parsley or basil. Taste and adjust the seasoning as needed.
**Step 3: Stuff the Eggplants:
**     • Spoon the filling mixture into the hollowed-out eggplant halves, packing it in tightly.
**     • If desired, sprinkle grated Parmesan cheese over the top of each stuffed eggplant half for extra flavor.
**Step 4: Bake the Stuffed Eggplants:
**     • Drizzle a little olive oil over the stuffed eggplants to help them brown in the oven.
**     • Place the baking sheet in the preheated oven and bake for 25-30 minutes, or until the eggplant is tender and the filling is heated through.
**Step 5: Serve:
**     • Once cooked, remove the stuffed eggplants from the oven and let them cool slightly before serving.
**     • Garnish with additional chopped fresh herbs, if desired.
**     • Serve the stuffed eggplants as a main course or side dish, alongside a fresh salad or crusty bread.'),
(10,4,'Stuffed eggplant','Stuffed eggplants, also known as eggplant boats or stuffed aubergines, are a flavorful and satisfying dish that features eggplants hollowed out and filled with a delicious mixture of ingredients','     • 2 large eggplants
**     • 1 cup cooked quinoa or rice
**     • 1 onion, finely chopped
**     • 2 cloves garlic, minced
**     • 1 bell pepper, diced
**     • 1 tomato, diced
**     • 1/2 cup cooked chickpeas (optional)
**     • 1/4 cup chopped fresh parsley or basil
**     • 1/4 cup grated Parmesan cheese (optional)
**     • Salt and pepper to taste
**     • Olive oil for cooking','Step 1: Prepare the Eggplants:
**     • Preheat your oven to 200°C (400°F).
**     • Cut the eggplants in half lengthwise, then use a spoon to scoop out the flesh, leaving about a 1/2-inch border around the edges. Reserve the flesh for later use.
**     • Place the hollowed-out eggplant halves on a baking sheet lined with parchment paper.
**Step 2: Prepare the Filling:
**     • Chop the reserved eggplant flesh into small pieces.
**     • In a large skillet, heat a tablespoon of olive oil over medium heat. Add the chopped onion and cook until softened, about 3-4 minutes.
**     • Add the minced garlic and diced bell pepper to the skillet, and cook for another 2-3 minutes.
**     • Stir in the chopped eggplant flesh and diced tomato, and cook for 5-6 minutes until the vegetables are tender.
**     • Add the cooked quinoa or rice to the skillet, along with the cooked chickpeas (if using). Stir to combine.
**     • Season the filling with salt, pepper, and chopped fresh herbs, such as parsley or basil. Taste and adjust the seasoning as needed.
**Step 3: Stuff the Eggplants:
**     • Spoon the filling mixture into the hollowed-out eggplant halves, packing it in tightly.
**     • If desired, sprinkle grated Parmesan cheese over the top of each stuffed eggplant half for extra flavor.
**Step 4: Bake the Stuffed Eggplants:
**     • Drizzle a little olive oil over the stuffed eggplants to help them brown in the oven.
**     • Place the baking sheet in the preheated oven and bake for 25-30 minutes, or until the eggplant is tender and the filling is heated through.
**Step 5: Serve:
**     • Once cooked, remove the stuffed eggplants from the oven and let them cool slightly before serving.
**     • Garnish with additional chopped fresh herbs, if desired.
**     • Serve the stuffed eggplants as a main course or side dish, alongside a fresh salad or crusty bread.'),
(11,11,'Grape harvest cake','Grape harvest cake, also known as Traubenkuchen in German, is a delightful dessert that features fresh grapes baked into a rich and tender cake batter','     • 1.5 cups all-purpose flour
**     • 1.5 teaspoons baking powder
**     • 1/2 teaspoon salt
**     • 1/2 cup unsalted butter, softened
**     • 3/4 cup granulated sugar
**     • 2 large eggs
**     • 1 teaspoon vanilla extract
**     • 1/3 cup milk
**     • 2 cups seedless grapes (red or green), rinsed and dried
**     • 1 tablespoon granulated sugar (for sprinkling)
**     • Powdered sugar, for dusting (optional)', 'Step 1: Preheat the Oven:
**     • Preheat your oven to 180°C (350°F). Grease and flour a 9-inch round cake pan or line it with parchment paper for easy removal.
**Step 2: Prepare the Batter:
**     • In a medium mixing bowl, whisk together the flour, baking powder, and salt. Set aside.
**     • In a separate large mixing bowl, cream together the softened butter and granulated sugar until light and fluffy.
**     • Add the eggs, one at a time, beating well after each addition. Stir in the vanilla extract.
**     • Gradually add the dry ingredients to the wet ingredients, alternating with the milk, and mix until just combined. Be careful not to overmix.
**Step 3: Assemble the Cake:
**     • Pour the batter into the prepared cake pan and spread it out evenly with a spatula.
**     • Arrange the rinsed and dried grapes on top of the batter, pressing them gently into the surface.
**     • Sprinkle the tablespoon of granulated sugar evenly over the grapes.
**Step 4: Bake the Cake:
**     • Place the cake pan in the preheated oven and bake for 35-40 minutes, or until the cake is golden brown and a toothpick inserted into the center comes out clean.
**     • Keep an eye on the cake during the last few minutes of baking to prevent over-browning.
**Step 5: Cool and Serve:
**     • Once baked, remove the cake from the oven and let it cool in the pan for about 10 minutes.
**     • Carefully transfer the cake to a wire rack to cool completely before slicing.
**     • Dust the cooled cake with powdered sugar before serving, if desired.
**Step 6: Enjoy:
**     • Serve the grape harvest cake slices on their own or with a dollop of whipped cream or a scoop of vanilla ice cream for a delicious dessert treat.'),
(12,12,'Lemonade','Making lemonade at home is simple and refreshing','     • 1 cup freshly squeezed lemon juice (about 4-6 lemons)
**     • 3/4 cup granulated sugar (adjust to taste)
**     • 4 cups cold water
**     • Ice cubes
**     • Lemon slices and mint leaves for garnish (optional)','Step 1: Prepare the Lemon Juice:
**     • Start by juicing the lemons until you have about 1 cup of freshly squeezed lemon juice. You can use a citrus juicer or simply squeeze the lemons by hand. Strain the juice to remove any seeds or pulp if desired.
**Step 2: Make the Simple Syrup:
**     • In a small saucepan, combine 1 cup of water with the granulated sugar.
**     • Heat the mixture over medium heat, stirring constantly until the sugar is completely dissolved. This creates a simple syrup that will sweeten the lemonade evenly.
**Step 3: Combine Lemon Juice and Simple Syrup:
**     • In a large pitcher, combine the freshly squeezed lemon juice with the simple syrup.
**     • Stir well to ensure that the lemon juice and syrup are thoroughly mixed.
**Step 4: Add Cold Water:
**     • Pour 4 cups of cold water into the pitcher with the lemon juice and simple syrup.
**     • Stir again to combine all the ingredients evenly. You can adjust the amount of water to your taste preferences. If you prefer a stronger lemon flavor, you can use less water.
**Step 5: Chill:
**     • Place the pitcher of lemonade in the refrigerator to chill for at least 1 hour, or until thoroughly chilled. This allows the flavors to meld together and ensures a refreshing cold drink.
**Step 6: Serve:
**     • Once chilled, fill glasses with ice cubes and pour the lemonade over the ice.
**     • Garnish each glass with a slice of lemon and a sprig of fresh mint if desired.
**     • Stir the lemonade before serving to distribute any settled pulp or sugar evenly.'),
(13,13,'Mango cheesecake','Making a mango cheesecake is a delightful way to combine the creamy richness of cheesecake with the tropical sweetness of mango','- For the Crust:
**     • 1.5 cups graham cracker crumbs
**     • 1/4 cup granulated sugar
**     • 1/2 cup unsalted butter, melted
**- For the Filling:
**     • 3 ripe mangoes, peeled and diced
**     • 24 oz (about 680g) cream cheese, softened
**     • 1 cup granulated sugar
**     • 1/4 cup mango juice or puree
**     • 4 large eggs
**     • 1 teaspoon vanilla extract
**     • 1/4 cup all-purpose flour
**- For the Topping (optional):
**     • Sliced mangoes
**     • Whipped cream','Step 1: Preheat Oven - Preheat your oven to 325°F (160°C).
**Step 2: Prepare the Crust:
**     • In a mixing bowl, combine the graham cracker crumbs, sugar, and melted butter until the mixture resembles wet sand.
**     • Press the mixture firmly into the bottom of a 9-inch springform pan. Use the bottom of a glass to press it evenly.
**     • Bake the crust in the preheated oven for 10 minutes. Remove and let it cool while preparing the filling.
**Step 3: Prepare the Filling:
**     • In a blender or food processor, puree the diced mangoes until smooth.
**     • In a large mixing bowl, beat the cream cheese until smooth and creamy.
**     • Gradually add the sugar and mango juice/puree, mixing until well combined.
**     • Add the eggs one at a time, mixing well after each addition.
**     • Stir in the vanilla extract and flour until fully incorporated.
**Step 4: Assemble and Bake:
**     • Pour the mango cheesecake filling over the cooled crust.
**     • Tap the pan gently on the counter to remove any air bubbles.
**     • Place the springform pan on a baking sheet (to catch any potential leaks) and bake in the preheated oven for 50-60 minutes, or until the center is set but slightly jiggly.
**Step 5: Chill:
**     • Once baked, turn off the oven and leave the cheesecake inside with the door slightly ajar for about an hour to cool gradually.
**     • Remove the cheesecake from the oven and let it cool completely at room temperature.
**     • Chill the cheesecake in the refrigerator for at least 4 hours, preferably overnight, to firm up.
**Step 6: Serve:
**     • Before serving, run a knife around the edge of the pan to loosen the cheesecake.
**     • Carefully remove the sides of the springform pan.
**     • Garnish the cheesecake with sliced mangoes and whipped cream, if desired.
**     • Slice and serve chilled. Enjoy your mango cheesecake!'),
(14,14,'Chicken and Napa cabbage','Chicken and Napa cabbage make for a delicious and nutritious dish with a balance of flavors and textures','     • 1 lb (about 450g) boneless, skinless chicken breasts or thighs, thinly sliced
**     • 1 small Napa cabbage, thinly sliced
**     • 3 cloves garlic, minced
**     • 1-inch piece of ginger, minced
**     • 2 tablespoons soy sauce
**     • 1 tablespoon oyster sauce
**     • 1 tablespoon rice vinegar
**     • 1 teaspoon sesame oil
**     • 1 tablespoon cornstarch (optional, for thickening the sauce)
**     • 2 tablespoons vegetable oil (for stir-frying)
**     • Salt and pepper to taste
**     • Optional garnishes: sliced green onions, sesame seeds','Step 1: Marinate the Chicken:
**     • In a bowl, combine the sliced chicken with soy sauce, rice vinegar, sesame oil, minced garlic, minced ginger, and a pinch of salt and pepper. Let it marinate for at least 15-20 minutes.
**Step 2: Prepare the Napa Cabbage:
**     • Rinse the Napa cabbage under cold water and pat it dry with paper towels.
**     • Remove any tough outer leaves and slice the cabbage thinly, discarding the tough stem.
**Step 3: Stir-Fry:
**     • Heat a large skillet or wok over medium-high heat and add vegetable oil.
**     • Once the oil is hot, add the marinated chicken to the skillet in a single layer. Cook for 2-3 minutes without stirring to allow it to brown on one side, then stir-fry until the chicken is cooked through. Remove the chicken from the skillet and set aside.
**Step 4: Cook the Napa Cabbage:
**     • In the same skillet, add a bit more oil if needed, then add the sliced Napa cabbage. Stir-fry for 3-4 minutes until the cabbage begins to wilt but still retains some crispness.
**Step 5: Combine:
**     • Return the cooked chicken to the skillet with the cabbage. Stir to combine.
**Step 6: Sauce:
**     • In a small bowl, mix together the oyster sauce and a tablespoon of water. Pour this mixture over the chicken and cabbage in the skillet. Stir well to coat evenly.
**     • If you prefer a thicker sauce, you can mix a tablespoon of cornstarch with a tablespoon of water and add it to the skillet. Stir until the sauce thickens slightly.
**Step 7: Serve:
**     • Once the sauce has thickened and everything is heated through, remove the skillet from the heat.
**     • Garnish with sliced green onions and sesame seeds if desired.
**     • Serve the Chicken and Napa Cabbage stir-fry hot over steamed rice or noodles.'),
(15,15,'Onion tart','An onion tart, also known as tarte à loignon in French cuisine, is a savory pastry dish featuring a rich filling of caramelized onions','- For the Pastry:
**     • 1.25 cups all-purpose flour
**     • 1/2 teaspoon salt
**     • 1/2 cup unsalted butter, cold and cubed
**     • 3-4 tablespoons ice water
**- For the Filling:
**     • 4 large onions, thinly sliced
**     • 2 tablespoons olive oil
**     • 2 tablespoons butter
**     • 1 teaspoon sugar
**     • Salt and pepper to taste
**     • 2 eggs
**     • 1/2 cup heavy cream
**     • 1/2 cup grated Gruyere or Swiss cheese
**     • Fresh thyme or parsley for garnish (optional)','Step 1: Prepare the Pastry:
**     • In a food processor, combine the flour and salt. Add the cold, cubed butter and pulse until the mixture resembles coarse crumbs.
**     • Gradually add the ice water, 1 tablespoon at a time, pulsing until the dough comes together.
**     • Shape the dough into a disk, wrap it in plastic wrap, and refrigerate for at least 30 minutes.
**Step 2: Preheat the Oven:
**     • Preheat your oven to 375°F (190°C).
**Step 3: Caramelize the Onions:
**     • Heat the olive oil and butter in a large skillet over medium heat.
**     • Add the thinly sliced onions and cook, stirring occasionally, until they become soft and golden brown, about 30-40 minutes.
**     • Sprinkle sugar over the onions to help with caramelization. Season with salt and pepper to taste.
**Step 4: Roll out the Pastry:
**     • On a lightly floured surface, roll out the chilled pastry dough into a circle large enough to fit your tart pan or pie dish.
**Step 5: Line the Tart Pan:
**     • Transfer the rolled-out pastry dough to your tart pan or pie dish, pressing it gently into the bottom and up the sides.
**     • Trim any excess dough hanging over the edges.
**Step 6: Prepare the Filling:
**     • In a bowl, whisk together the eggs and heavy cream until well combined. Season with salt and pepper.
**     • Spread the caramelized onions evenly over the bottom of the pastry crust.
**     • Pour the egg and cream mixture over the onions, spreading it out evenly.
**     • Sprinkle the grated cheese over the top of the filling.
**Step 7: Bake:
**     • Place the tart pan on a baking sheet (to catch any drips) and transfer it to the preheated oven.
**     • Bake for 25-30 minutes, or until the filling is set and the pastry is golden brown.
**Step 8: Serve:
**     • Once baked, remove the tart from the oven and let it cool for a few minutes.
**     • Garnish with fresh thyme or parsley if desired.
**     • Slice and serve the onion tart warm or at room temperature.'),
(16,16,'Baked orange chicken','Baked orange chicken is a healthier alternative to the classic deep-fried version. It features tender chicken pieces coated in a flavorful orange sauce and baked to perfection.','- For the Chicken:
**     • 1.5 lbs (about 680g) boneless, skinless chicken breasts, cut into bite-sized pieces
**     • 1/2 cup all-purpose flour
**     • 2 large eggs, beaten
**     • 1 cup Panko breadcrumbs
**     • Salt and pepper to taste
**- For the Orange Sauce:
**     • 1/2 cup orange juice
**     • Zest of 1 orange
**     • 1/4 cup low-sodium soy sauce
**     • 2 tablespoons rice vinegar
**     • 2 tablespoons honey
**     • 2 cloves garlic, minced
**     • 1 teaspoon grated ginger
**     • 1 tablespoon cornstarch
**     • 1 tablespoon water
**     • Optional: Red pepper flakes for heat (to taste)
**     • Optional garnish: Sliced green onions, sesame seeds','Step 1: Preheat the Oven:
**     • Preheat your oven to 400°F (200°C). Line a baking sheet with parchment paper or lightly grease it with cooking spray.
**Step 2: Prepare the Chicken:
**     • Season the chicken pieces with salt and pepper.
**     • Set up a breading station with three shallow bowls: one with flour, one with beaten eggs, and one with Panko breadcrumbs.
**     • Dredge each piece of chicken in flour, shaking off any excess. Dip it into the beaten eggs, allowing any excess to drip off, then coat it evenly with Panko breadcrumbs. Place the breaded chicken pieces on the prepared baking sheet.
**Step 3: Bake the Chicken:
**     • Place the baking sheet in the preheated oven and bake the chicken for 20-25 minutes, or until the chicken is cooked through and golden brown, flipping halfway through for even browning.
**Step 4: Make the Orange Sauce:
**     • While the chicken is baking, prepare the orange sauce. In a small saucepan, combine the orange juice, orange zest, soy sauce, rice vinegar, honey, minced garlic, and grated ginger.
**     • Bring the mixture to a simmer over medium heat, stirring occasionally.
**Step 5: Thicken the Sauce:
**     • In a small bowl, mix together the cornstarch and water to make a slurry.
**     • Slowly pour the cornstarch slurry into the simmering sauce, whisking constantly to prevent lumps.
**     • Continue to simmer the sauce until it thickens to your desired consistency. If you prefer a thicker sauce, you can add more cornstarch slurry.
**Step 6: Combine the Chicken and Sauce:
**     • Once the chicken is done baking, transfer it to a large bowl.
**     • Pour the thickened orange sauce over the baked chicken pieces and toss to coat evenly.
**Step 7: Serve:
**     • Garnish the baked orange chicken with sliced green onions and sesame seeds if desired.
**     • Serve the chicken hot over steamed rice or with your favorite side dishes.'),
(17,17,'Peach caprese salad',' A peach Caprese salad is a delightful twist on the traditional Caprese salad, incorporating fresh, ripe peaches to add a sweet and juicy flavor','     • 2 large ripe peaches, thinly sliced
**     • 2 medium tomatoes, thinly sliced
**     • 8 oz (about 225g) fresh mozzarella cheese, thinly sliced
**     • Fresh basil leaves
**     • Balsamic glaze or reduction
**     • Extra virgin olive oil
**     • Salt and pepper to taste','Step 1: Prepare the Ingredients:
**     • Wash and dry the peaches, tomatoes, and basil leaves.
**     • Slice the peaches, tomatoes, and fresh mozzarella cheese into thin, even slices.
**Step 2: Assemble the Salad:
**     • On a large serving platter or individual plates, arrange the slices of peaches, tomatoes, and fresh mozzarella cheese in alternating layers.
**     • Tuck fresh basil leaves in between the slices of fruit and cheese.
**Step 3: Season:
**     • Drizzle extra virgin olive oil over the assembled salad.
**     • Sprinkle with salt and freshly ground black pepper to taste.
**Step 4: Finish with Balsamic Glaze:
**     • Drizzle balsamic glaze or reduction over the peach Caprese salad. The sweetness of the balsamic glaze complements the sweetness of the peaches and enhances the flavors of the salad.
**Step 5: Serve:
**     • Serve the peach Caprese salad immediately as an appetizer or side dish.
**     • Enjoy the combination of sweet, juicy peaches, creamy mozzarella cheese, ripe tomatoes, and aromatic basil, all enhanced by the tangy balsamic glaze.
**Optional Variations:
**     • Add a handful of arugula or mixed greens for added freshness and texture.
**     • Top the salad with toasted nuts, such as pine nuts or sliced almonds, for added crunch.
**     • Drizzle with honey for extra sweetness, if desired.'),
(18,18,' Potato casserolese',' Potato casseroles are comforting and versatile dishes that can be served as a side dish or a main course','     • 4-5 large potatoes, peeled and thinly sliced
**     • 1 onion, thinly sliced
**     • 2 cloves garlic, minced (optional)
**     • 1 cup shredded cheese (cheddar, mozzarella, or a blend)
**     • 1 cup milk or cream
**     • 2 tablespoons butter, melted
**     • Salt and pepper to taste
**     • Fresh herbs (such as thyme or parsley) for garnish (optional)','Step 1: Preheat the Oven:
**     • Preheat your oven to 375°F (190°C). Grease a baking dish with butter or cooking spray.
**Step 2: Layer the Potatoes:
**     • Arrange a layer of thinly sliced potatoes at the bottom of the baking dish, slightly overlapping each other.
**     • Sprinkle a layer of sliced onions and minced garlic (if using) over the potatoes.
**     • Season with salt and pepper.
**Step 3: Repeat Layers:
**     • Continue layering the potatoes, onions, and garlic until all the ingredients are used, ending with a layer of potatoes on top.
**Step 4: Make the Sauce:
**     • In a separate bowl, mix together the shredded cheese, milk or cream, melted butter, and additional salt and pepper if desired. You can also add a pinch of nutmeg or paprika for extra flavor.
**Step 5: Pour the Sauce:
**     • Pour the cheese and milk mixture evenly over the layered potatoes, ensuring that it seeps down between the layers.
**Step 6:Bake:
**     • Cover the baking dish with aluminum foil and bake in the preheated oven for about 45-50 minutes, or until the potatoes are tender when pierced with a fork.
**Step 7: Brown the Top:
**     • Remove the foil and continue baking for an additional 10-15 minutes, or until the top of the casserole is golden brown and bubbly.
**Step 8: Garnish and Serve:
**     • Once the potato casserole is done baking, remove it from the oven and let it cool for a few minutes.
**     • Garnish with fresh herbs, if desired, before serving.
**Step 9: Serve:
**     • Serve the potato casserole hot as a side dish or a main course alongside your favorite protein and vegetables.
**Variations:
**     • Add crispy bacon or diced ham for a meatier version.
**     • Mix in some cooked spinach or broccoli for added nutrients.
**     • Experiment with different types of cheese, such as Swiss, Gruyere, or Parmesan, for unique flavor combinations.'),
(19,19,'Cucumber radish slaw',' Cucumber radish slaw is a refreshing and crunchy salad that pairs well with a variety of dishes, from grilled meats to sandwiches and tacos','     • 2 medium cucumbers, thinly sliced
**     • 1 bunch radishes, thinly sliced
**     • 1/4 cup red onion, thinly sliced (optional)
**     • 1/4 cup fresh cilantro or parsley, chopped
**     • 1/4 cup apple cider vinegar or rice vinegar
**     • 2 tablespoons olive oil
**     • 1 tablespoon honey or maple syrup (adjust to taste)
**     • Salt and pepper to taste
**     • Optional: Red pepper flakes for heat','Step 1: Prepare the Vegetables:
**     • Wash the cucumbers and radishes thoroughly under cold water.
**     • Trim the ends of the cucumbers and radishes, then thinly slice them using a sharp knife or a mandoline slicer.
**     • If using red onion, peel and thinly slice it.
**Step 2: Make the Dressing:
**     • In a small bowl, whisk together the apple cider vinegar or rice vinegar, olive oil, honey or maple syrup, salt, pepper, and red pepper flakes (if using). Adjust the sweetness and seasoning to taste.
**Step 3: Combine the Ingredients:
**     • In a large mixing bowl, combine the sliced cucumbers, radishes, sliced red onion (if using), and chopped cilantro or parsley.
**Step 4: Dress the Slaw:
**     • Pour the prepared dressing over the cucumber and radish mixture.
**     • Toss well to coat the vegetables evenly with the dressing.
**Step 5: Chill:
**     • Cover the bowl with plastic wrap or transfer the slaw to an airtight container.
**     • Refrigerate the cucumber radish slaw for at least 30 minutes to allow the flavors to meld together and the vegetables to marinate.
**Step 6: Serve:
**     • Once chilled, give the slaw a final toss.
**     • Serve the cucumber radish slaw as a refreshing side dish or topping for tacos, sandwiches, or grilled meats.
**Variations:
**     • Add shredded carrots or cabbage for extra color and texture.
**     • Experiment with different herbs such as mint or basil for added freshness.
**     • For creamier slaw, mix in a tablespoon of Greek yogurt or mayonnaise to the dressing'),
(20,7,'Cucumber radish slaw',' Cucumber radish slaw is a refreshing and crunchy salad that pairs well with a variety of dishes, from grilled meats to sandwiches and tacos','     • 2 medium cucumbers, thinly sliced
**     • 1 bunch radishes, thinly sliced
**     • 1/4 cup red onion, thinly sliced (optional)
**     • 1/4 cup fresh cilantro or parsley, chopped
**     • 1/4 cup apple cider vinegar or rice vinegar
**     • 2 tablespoons olive oil
**     • 1 tablespoon honey or maple syrup (adjust to taste)
**     • Salt and pepper to taste
**     • Optional: Red pepper flakes for heat','Step 1. Prepare the Vegetables:
**     • Wash the cucumbers and radishes thoroughly under cold water.
**     • Trim the ends of the cucumbers and radishes, then thinly slice them using a sharp knife or a mandoline slicer.
**     • If using red onion, peel and thinly slice it.
**Step 2: Make the Dressing:
**     • In a small bowl, whisk together the apple cider vinegar or rice vinegar, olive oil, honey or maple syrup, salt, pepper, and red pepper flakes (if using). Adjust the sweetness and seasoning to taste.
**Step 3: Combine the Ingredients:
**     • In a large mixing bowl, combine the sliced cucumbers, radishes, sliced red onion (if using), and chopped cilantro or parsley.
**Step 4: Dress the Slaw:
**     • Pour the prepared dressing over the cucumber and radish mixture.
**     • Toss well to coat the vegetables evenly with the dressing.
**Step 5: Chill:
**     • Cover the bowl with plastic wrap or transfer the slaw to an airtight container.
**     • Refrigerate the cucumber radish slaw for at least 30 minutes to allow the flavors to meld together and the vegetables to marinate.
**Step 6: Serve:
**     • Once chilled, give the slaw a final toss.
**     • Serve the cucumber radish slaw as a refreshing side dish or topping for tacos, sandwiches, or grilled meats.
**Variations:
**     • Add shredded carrots or cabbage for extra color and texture.
**     • Experiment with different herbs such as mint or basil for added freshness.
**     • For creamier slaw, mix in a tablespoon of Greek yogurt or mayonnaise to the dressing.'),
(21,20,'Chikoo milkshake','Chikoo, also known as sapodilla or sapota, makes a delicious and creamy milkshake that is perfect for a refreshing drink on a hot day','     • 2 ripe chikoos, peeled and chopped
**     • 1 cup chilled milk (dairy or non-dairy)
**     • 2-3 tablespoons sugar, honey, or sweetener of your choice (adjust to taste)
**     • 1/4 teaspoon ground cardamom (optional)
**     • Ice cubes (optional)','Step 1: Prepare the Chikoos:
**     • Wash the chikoos thoroughly under cold water.
**     • Peel the chikoos and remove any seeds.
**     • Chop the chikoos into small pieces.
**Step 2: Blend the Ingredients:
**     • In a blender, combine the chopped chikoos, chilled milk, sugar or sweetener, and ground cardamom (if using).
**     • If you prefer a thicker milkshake, you can add a handful of ice cubes to the blender.
**Step 3: Blend Until Smooth:
**     • Blend the ingredients on high speed until smooth and creamy. If needed, you can add more milk to reach your desired consistency.
**Step 4: Taste and Adjust:
**     • Taste the chikoo milkshake and adjust the sweetness according to your preference by adding more sugar or sweetener if necessary.
**Step 5: Serve:
**     • Once blended to your liking, pour the chikoo milkshake into serving glasses.
**     • Optionally, you can garnish with a sprinkle of ground cardamom or chopped chikoo on top.'),
(22,21,'Roasted tomatoes','Roasted tomatoes make for a versatile and flavorful ingredient that can be used in a variety of dishes, such as pasta sauces, soups, salads, sandwiches, and more','     • Tomatoes (any variety such as Roma, cherry, grape, or heirloom)
**     • Olive oil
**     • Salt
**     • Pepper
**     • Optional: Garlic cloves, fresh herbs (such as thyme or rosemary)','Step 1: Preheat the Oven:
**     • Preheat your oven to 375°F (190°C). Line a baking sheet with parchment paper or aluminum foil for easy cleanup.
**Step 2: Prepare the Tomatoes:
**     • Wash the tomatoes thoroughly under cold water and pat them dry with paper towels.
**     • Depending on the size of the tomatoes, you can leave them whole, halve them, or slice them into thick wedges.
**Step 3: Season the Tomatoes:
**     • Place the tomatoes on the prepared baking sheet in a single layer.
**     • Drizzle olive oil over the tomatoes, ensuring they are evenly coated.
**     • Season with salt and pepper to taste.
**     • Optionally, you can add whole garlic cloves or sprinkle fresh herbs over the tomatoes for added flavor.
**Step 4: Roast the Tomatoes:
**     • Transfer the baking sheet to the preheated oven and roast the tomatoes for 25-30 minutes, or until they are softened and caramelized around the edges.
**Step 5: Broil (Optional):
**     • For an extra charred and caramelized finish, you can switch the oven to broil mode for the last 2-3 minutes of cooking. Keep a close eye on the tomatoes to prevent burning.
**Step 6: Serve or Store:
**     • Once roasted to your liking, remove the baking sheet from the oven.
**     • Let the roasted tomatoes cool slightly before serving or using in your favorite recipes.
**Tips:
**     • Experiment with different varieties of tomatoes for varying flavors and textures.
**     • Use roasted tomatoes as a topping for pizzas, bruschetta, or crostini.
**     • Blend roasted tomatoes into sauces or soups for added depth of flavor.
**     • Store any leftover roasted tomatoes in an airtight container in the refrigerator for up to a week, or freeze them for longer storage.'),
(23,22,'Beet and turnip gratin','A beet and turnip gratin is a delicious and comforting dish that combines the earthy sweetness of beets with the mild, slightly peppery flavor of turnips, all topped with a creamy cheese sauce and baked to perfection','     • 2-3 medium-sized beets, peeled and thinly sliced
**     • 2-3 medium-sized turnips, peeled and thinly sliced
**     • 2 cloves garlic, minced
**     • 1 cup heavy cream
**     • 1 cup grated cheese (Gruyere, Swiss, or cheddar work well)
**     • 2 tablespoons butter
**     • 2 tablespoons all-purpose flour
**     • Salt and pepper to taste
**     • Fresh thyme or rosemary for garnish (optional)','Step 1: Preheat the Oven:
**     • Preheat your oven to 375°F (190°C). Grease a baking dish with butter or cooking spray.
**Step 2: Prepare the Vegetables:
**     • Wash, peel, and thinly slice the beets and turnips using a sharp knife or mandoline slicer. Make sure the slices are uniform in thickness for even cooking.
**Step 3: Make the Cheese Sauce:
**     • In a saucepan, melt the butter over medium heat.
**     • Add the minced garlic and sauté for 1-2 minutes until fragrant.
**     • Sprinkle the flour over the butter and garlic, stirring constantly to form a roux. Cook for 1-2 minutes until the roux is lightly golden.
**     • Gradually pour in the heavy cream while whisking continuously to avoid lumps.
**     • Cook the sauce, stirring constantly, until it thickens enough to coat the back of a spoon.
**     • Remove the saucepan from the heat and stir in half of the grated cheese until melted. Season with salt and pepper to taste.
**Step 4: Assemble the Gratin:
**     • Arrange a layer of sliced beets in the bottom of the prepared baking dish, slightly overlapping them.
**     • Top the layer of beets with a layer of sliced turnips.
**     • Pour half of the cheese sauce over the vegetables, spreading it evenly with a spatula.
**     • Repeat the layers with the remaining beets, turnips, and cheese sauce.
**Step 5: Bake:
**     • Cover the baking dish with aluminum foil and place it in the preheated oven.
**     • Bake the beet and turnip gratin for 40-45 minutes, or until the vegetables are tender when pierced with a fork.
**Step 6: Add Cheese Topping:
**     • Remove the foil from the baking dish and sprinkle the remaining grated cheese over the top of the gratin.
**     • Return the gratin to the oven and bake for an additional 10-15 minutes, or until the cheese is melted and bubbly and the top is golden brown.
**Step 7: Serve:
**     • Once baked to perfection, remove the beet and turnip gratin from the oven and let it cool for a few minutes.
**     • Garnish with fresh thyme or rosemary, if desired, before serving.'),
(24,23,'Cheesy zucchini casserole','Cheesy zucchini casserole is a delicious and comforting dish that combines tender zucchini with a creamy cheese sauce and crispy topping','     • 4-5 medium zucchini, sliced into rounds or half-moons
**     • 1 onion, chopped
**     • 2 cloves garlic, minced
**     • 2 tablespoons butter
**     • 2 tablespoons all-purpose flour
**     • 1 cup milk
**     • 1 cup shredded cheese (cheddar, mozzarella, or a blend)
**     • 1/4 cup grated Parmesan cheese
**     • Salt and pepper to taste
**     • 1/2 cup breadcrumbs or crushed crackers
**     • 2 tablespoons melted butter
**     • Optional: Fresh herbs (such as parsley or thyme) for garnish','Step 1. Preheat the Oven:
**     • Preheat your oven to 375°F (190°C). Grease a baking dish with butter or cooking spray.
**Step 2: Prepare the Zucchini:
**     • Wash the zucchini thoroughly under cold water and slice them into rounds or half-moons, depending on your preference.
**Step 3: Make the Cheese Sauce:
**     • In a saucepan, melt the butter over medium heat.
**     • Add the chopped onion and minced garlic to the melted butter and sauté until softened.
**     • Sprinkle the flour over the onion and garlic mixture, stirring constantly to form a roux.
**     • Gradually pour in the milk while whisking continuously to avoid lumps.
**     • Cook the sauce, stirring constantly, until it thickens enough to coat the back of a spoon.
**     • Remove the saucepan from the heat and stir in the shredded cheese until melted. Season with salt and pepper to taste.
**Step 4: Assemble the Casserole:
**     • In the prepared baking dish, arrange a layer of sliced zucchini.
**     • Pour half of the cheese sauce over the layer of zucchini, spreading it evenly with a spatula.
**     • Repeat the layers with the remaining zucchini and cheese sauce.
**Step 5: Prepare the Topping:
**     • In a small bowl, combine the breadcrumbs or crushed crackers with the grated Parmesan cheese.
**     • Drizzle the melted butter over the breadcrumb mixture and toss to combine.
**Step 6: Add the Topping:
**     • Sprinkle the breadcrumb mixture evenly over the top of the zucchini and cheese sauce layers.
**Step 7: Bake:
**     • Cover the baking dish with aluminum foil and place it in the preheated oven.
**     • Bake the cheesy zucchini casserole for 25-30 minutes, or until the zucchini is tender when pierced with a fork and the topping is golden brown and crispy.
**Step 8: Serve:
**     • Once baked to perfection, remove the casserole from the oven and let it cool for a few minutes.
**     • Garnish with fresh herbs, if desired, before serving.'),
(25, 8, 'Breakfast Egg Muffins', 'Breakfast Egg Muffins, Breakfast egg muffins are a delicious and convenient way to enjoy a nutritious breakfast on the go', 
'     • 6 large eggs
**     • 1/4 cup milk
**     • Salt and pepper to taste
**     • 1/2 cup chopped vegetables (such as bell peppers, onions, spinach, mushrooms, etc.)
**     • 1/2 cup shredded cheese (cheddar, mozzarella, or your favorite type)
**     • Optional: cooked bacon, sausage, ham, or turkey, diced',
'Step1: Preheat your oven to 350°F (175°C). Grease a muffin tin with cooking spray or line with paper liners.
**Step2: In a mixing bowl, whisk together the eggs, milk, salt, and pepper until well combined.
**Step3: Stir in the chopped vegetables and shredded cheese. If you are using any cooked meats, add them to the mixture as well.
**Step4: Pour the egg mixture evenly into the prepared muffin tin, filling each cup about 3/4 full.
**Step5: Bake in the preheated oven for 20-25 minutes, or until the muffins are set and slightly golden on top.
**Step6: Remove the muffin tin from the oven and let the muffins cool for a few minutes before removing them from the tin.
**Step7: Serve the breakfast egg muffins warm, or allow them to cool completely before storing them in an airtight container in the refrigerator for up to 3-4 days.'),
(26, 8, 'Shakshouka', 'Shakshouka is a flavorful and hearty North African and Middle Eastern dish made with poached eggs in a spicy tomato and pepper sauce',
'     • 2 tablespoons olive oil
**     • 1 onion, finely chopped
**     • 2-3 cloves garlic, minced
**     • 1 red bell pepper, diced
**     • 1 yellow bell pepper, diced
**     • 1 teaspoon ground cumin
**     • 1 teaspoon paprika
**     • 1/2 teaspoon chili powder (adjust to taste)
**     • 1/4 teaspoon cayenne pepper (optional, for extra heat)
**     • 1 can (14 oz) diced tomatoes
**     • Salt and pepper to taste
**     • 4-6 large eggs
**     • Fresh parsley or cilantro, chopped (for garnish)
**     • Crumbled feta cheese (optional, for serving)
**     • Crusty bread or pita (for serving)', 'Step1: Heat olive oil in a large skillet or frying pan over medium heat.
**Step2: Add the chopped onion and sauté until soft and translucent, about 5 minutes.
**Step3: Stir in the minced garlic and diced bell peppers, and cook for another 5 minutes until the peppers are softened.
**Step4: Add the ground cumin, paprika, chili powder, and cayenne pepper (if using). Stir well to coat the vegetables with the spices.
**Step5: Pour in the diced tomatoes with their juices. Season with salt and pepper to taste. Allow the mixture to simmer for about 10-15 minutes, until the sauce has thickened slightly.
**Step6: Using a spoon, create small wells or indentations in the sauce. Crack one egg into each well. Cover the skillet with a lid and let the eggs cook for about 5-7 minutes, or until the whites are set but the yolks are still runny (cook longer if you prefer firmer yolks).
**Step7: Once the eggs are cooked to your liking, remove the skillet from the heat. Garnish with chopped parsley or cilantro.
**Step8: Serve the shakshouka hot, directly from the skillet, with crusty bread or pita on the side for dipping. You can also sprinkle some crumbled feta cheese on top for extra flavor.'),
(27, 8, 'Frittata', 'Frittata is an Italian dish similar to an omelette or crustless quiche, made with eggs and various ingredients such as vegetables, meats, cheeses, and herbs. It is a versatile dish that can be served for breakfast, brunch, lunch, or dinner',
'     • 8 large eggs
**     • 1/4 cup milk or heavy cream
**     • Salt and pepper to taste
**     • 1 tablespoon olive oil or butter
**     • 1 small onion, diced
**     • 1 bell pepper, diced
**     • 1 cup chopped vegetables (such as spinach, mushrooms, tomatoes, zucchini, etc.)
**     • 1/2 cup shredded cheese (such as cheddar, mozzarella, feta, etc.)
**     • Optional: cooked bacon, sausage, ham, or turkey, diced
**     • Fresh herbs (such as parsley, basil, thyme, etc.), chopped for garnish','Step1: Preheat your oven to 350°F (175°C).
**Step2: In a large mixing bowl, whisk together the eggs, milk or cream, salt, and pepper until well combined.
**Step3: Heat olive oil or butter in a large oven-safe skillet (preferably non-stick) over medium heat.
**Step4: Add the diced onion and bell pepper to the skillet and sauté until softened, about 5 minutes.
**Step5: Stir in the chopped vegetables and any cooked meats you are using. Cook for another 3-4 minutes until the vegetables are tender.
**Step6: Spread the vegetables evenly in the skillet and pour the egg mixture over the top.
**Step7: Sprinkle the shredded cheese evenly over the egg mixture.
**Step8: Cook the frittata on the stovetop for 3-4 minutes, until the edges begin to set.
**Step9: Transfer the skillet to the preheated oven and bake the frittata for 15-20 minutes, or until the center is set and the top is golden brown.
**Step10: Once cooked, remove the skillet from the oven and let the frittata cool for a few minutes.
**Step11: Use a spatula to loosen the edges of the frittata from the skillet, then slide it onto a cutting board.
**Step12: Slice the frittata into wedges or squares, garnish with fresh herbs, and serve hot or at room temperature.'),
(28,1,'Apple pie', 
'Apple pie is a classic dessert that is beloved for its sweet, cinnamon-spiced filling and flaky crust',
'- For the crust:
**     • 2 1/2 cups all-purpose flour
**     • 1 teaspoon salt
**     • 1 teaspoon granulated sugar
**     • 1 cup cold unsalted butter, cut into small cubes
**     • 6-8 tablespoons ice water
**     • For the filling:
**     • 6-8 medium-sized apples (such as Granny Smith or Honeycrisp), peeled, cored, and sliced
**     • 3/4 cup granulated sugar
**     • 2 tablespoons all-purpose flour
**     • 1 teaspoon ground cinnamon
**     • 1/4 teaspoon ground nutmeg
**     • 1 tablespoon lemon juice
- For assembling:
**     • 1 egg, beaten (for egg wash)
**     • 1 tablespoon granulated sugar (for sprinkling)',
'- For the pie crust:
**Step 1: In a large mixing bowl, combine the flour, salt, and granulated sugar
**Step 2: Add the cold cubed butter to the flour mixture: Using a pastry cutter or your fingertips, work the butter into the flour until the mixture resembles coarse crumbs
**Step 3: Gradually add the ice water, 1 tablespoon at a time, mixing with a fork, until the dough starts to come together
**Step 4: Turn the dough out onto a lightly floured surface and knead it gently until it forms a cohesive ball: Divide the dough in half, shape each half into a disk, wrap them in plastic wrap, and refrigerate for at least 1 hour before using
- For the filling:
**Step 1: In a large mixing bowl, combine the sliced apples, granulated sugar, brown sugar, lemon juice, flour, cinnamon, nutmeg, and salt: Toss until the apples are evenly coated
- To assemble the pie:
**Step 1: Preheat your oven to 375°F (190°C):
**Step 2: On a lightly floured surface, roll out one disk of chilled pie dough into a circle large enough to fit into the bottom of a 9-inch pie dish: Carefully transfer the dough to the pie dish, pressing it gently into the bottom and up the sides
**Step 3: Pour the apple filling into the prepared pie crust, spreading it out evenly: Dot the top of the filling with pieces of butter
**Step 4: Roll out the second disk of chilled pie dough into a circle large enough to cover the filling: Place it over the apples
**Step 5: Trim any excess dough from the edges, then crimp the edges of the pie crust together to seal: Cut a few slits in the top crust to allow steam to escape
**Step 6: Brush the top crust with the beaten egg, then sprinkle it with granulated sugar
**Step 7: Place the pie on a baking sheet (to catch any drips) and bake in the preheated oven for 45-55 minutes, or until the crust is golden brown and the filling is bubbling
**Step 8: If the edges of the crust start to brown too quickly, cover them with aluminum foil or a pie crust shield
**Step 9: Once baked, remove the pie from the oven and let it cool on a wire rack for at least 1 hour before slicing and serving'),
(29,1,'Apple ricotta pancakes','Apple ricotta pancakes are a delightful twist on traditional pancakes, incorporating the creamy texture of ricotta cheese and the sweet flavor of apples', 
'     • 1 cup all-purpose flour
**     • 1 tablespoon granulated sugar
**     • 1 teaspoon baking powder
**     • 1/2 teaspoon baking soda
**     • 1/4 teaspoon salt
**     • 1/2 cup ricotta cheese
**     • 3/4 cup milk
**     • 1 large egg
**     • 1 teaspoon vanilla extract
**     • 1 apple, peeled, cored, and grated or finely chopped
**     • Butter or oil for cooking
**     • Maple syrup and extra apple slices for serving (optional)',
'Step 1: In a large mixing bowl, whisk together the flour, sugar, baking powder, baking soda, and salt
**Step 2: In a separate bowl, whisk together the ricotta cheese, milk, egg, and vanilla extract until well combined
**Step 3: Pour the wet ingredients into the dry ingredients and stir until just combined: Be careful not to overmix; a few lumps in the batter are okay
**Step 4: Gently fold in the grated or chopped apple until evenly distributed throughout the batter
**Step 5: Heat a non-stick skillet or griddle over medium heat and add a small amount of butter or oil to grease the surface:
**Step 6: Once the skillet is hot, pour 1/4 cup of batter onto the skillet for each pancake, spreading it slightly into a round shape
**Step 7: Cook the pancakes for 2-3 minutes on the first side, or until bubbles form on the surface and the edges start to set
**Step 8: Flip the pancakes with a spatula and cook for an additional 1-2 minutes on the second side, or until golden brown and cooked through
**Step 9: Remove the pancakes from the skillet and keep warm while you cook the remaining batter, adding more butter or oil to the skillet as needed
**Step 10: Serve the apple ricotta pancakes warm, topped with maple syrup and extra apple slices if desired'),
(30,2,'Navy bean soup','Navy bean soup is a comforting and nutritious dish that is perfect for chilly days', 
'     • 1 lb (about 2 cups) dried navy beans, rinsed and sorted
**     • 1 tablespoon olive oil
**     • 1 onion, chopped
**     • 2 carrots, chopped
**     • 2 celery stalks, chopped
**     • 3 cloves garlic, minced
**     • 8 cups chicken or vegetable broth
**     • 2 bay leaves
**     • 1 teaspoon dried thyme
**     • Salt and pepper to taste
**     • Optional: 1 ham hock or 8 oz diced ham
**     • Fresh parsley or thyme for garnish (optional)',
'Step 1: In a large pot or Dutch oven, heat the olive oil over medium heat: Add the chopped onion, carrots, and celery, and cook until the vegetables are softened, about 5-7 minutes
**Step 2: Add the minced garlic and cook for an additional minute until fragrant:
**Step 3: If using, add the ham hock or diced ham to the pot
**Step 4: Add the rinsed navy beans, chicken or vegetable broth, bay leaves, and dried thyme to the pot: Stir to combine
**Step 5: Bring the soup to a boil, then reduce the heat to low: Cover the pot and let the soup simmer gently for 1:5 to 2 hours, or until the navy beans are tender: Stir occasionally and add more broth or water if needed to keep the beans covered
**Step 6: Once the beans are tender, remove the bay leaves and, if using a ham hock, remove it from the soup: If using diced ham, leave it in the soup
**Step 7: Taste the soup and season with salt and pepper to taste
**Step 8: If desired, use an immersion blender to partially blend the soup for a thicker consistency, or leave it chunky:
**Step 9: Serve the navy bean soup hot, garnished with fresh parsley or thyme if desired'),
(31,2,'Black bean burgers','Black bean burgers are a flavorful and satisfying vegetarian alternative to traditional meat burgers',
'     • 2 cans (15 oz each) black beans, drained and rinsed
**     • 1 small onion, finely chopped
**     • 2 cloves garlic, minced
**     • 1 bell pepper, finely chopped
**     • 1 cup bread crumbs (you can use gluten-free bread crumbs if needed)
**     • 1 tablespoon chili powder
**     • 1 teaspoon cumin
**     • 1 teaspoon paprika
**     • Salt and pepper to taste
**     • Olive oil for cooking',
'Step 1: Preheat your oven to 375°F (190°C).
**Step 2: In a large mixing bowl, mash the black beans with a fork or potato masher until they are mostly mashed but still have some texture.
**Step 3: Add the chopped onion, minced garlic, chopped bell pepper, bread crumbs, chili powder, cumin, paprika, salt, and pepper to the mashed black beans. Mix well until everything is evenly combined.
**Step 4: Form the mixture into burger patties of your desired size and thickness. If the mixture is too wet, you can add more bread crumbs to help bind it together.
**Step 5: Heat a skillet over medium heat and add a little olive oil. Once the oil is hot, place the burger patties in the skillet and cook for about 3-4 minutes on each side, or until they are golden brown and crispy.
**Step 6: Transfer the partially cooked patties to a baking sheet lined with parchment paper and bake in the preheated oven for 10-15 minutes, or until they are heated through and firm.
**Step 7: Serve the black bean burgers on buns with your favorite toppings, such as lettuce, tomato, avocado, onions, and condiments like ketchup or mustard.'),
(32,3,'Beetroot carrot sandwich',
'A beetroot and carrot sandwich is a delightful and nutritious option for a light meal or snack',
'     • 4 slices of whole grain bread
**     • 1 medium beetroot, peeled and grated
**     • 1 medium carrot, peeled and grated
**     • 1/4 cup Greek yogurt or mayonnaise
**     • 1 tablespoon lemon juice
**     • 1 tablespoon fresh parsley, chopped
**     • Salt and pepper to taste
**     • Lettuce leaves (optional)
**     • Slices of cheese (optional)',
'Step 1: Start by spreading hummus or cream cheese evenly on one side of each bread slice.
**Step 2: Layer the sliced beetroot on one slice of bread.
**Step 3: Sprinkle the grated carrot on top of the beetroot.
**Step 4: Season with salt and pepper to taste.
**Step 5: Place the lettuce leaves on top of the carrot.
**Step 6: Drizzle a little balsamic glaze or olive oil if desired.
**Step 7: Top with the other bread slice, hummus/cream cheese side down.
**Step 8: Press gently to make sure everything sticks together.
**Step 9: Cut the sandwich in half if desired and serve.'),
(33,3,'Beetroot burger', 'Beetroot burgers are a fantastic vegetarian option that is both delicious and nutritious',
'     • 2 medium-sized beetroots, peeled and grated
**     • 1 can (15 oz) chickpeas, drained and rinsed
**     • 1 cup cooked quinoa or brown rice
**     • 1 small onion, finely chopped
**     • 2 cloves garlic, minced
**     • 1 teaspoon ground cumin
**     • 1 teaspoon paprika
**     • Salt and pepper to taste
**     • 1 tablespoon olive oil', 
'Step 1: Preheat your oven to 375°F (190°C).
**Step 2: In a large mixing bowl, combine the grated beetroot, chickpeas, cooked quinoa or brown rice, chopped onion, minced garlic, ground cumin, paprika, salt, and pepper. Mix well until everything is evenly combined.
**Step 3: Using your hands, shape the mixture into burger patties.
**Step 4: Heat olive oil in a skillet over medium heat. Once hot, add the beetroot burger patties and cook for about 3-4 minutes on each side until they are lightly browned.
**Step 5: Transfer the partially cooked beetroot burgers onto a baking sheet lined with parchment paper.
**Step 6: Place the baking sheet in the preheated oven and bake for an additional 15-20 minutes, or until the burgers are cooked through and firm.
**Step 7: Once the beetroot burgers are cooked, remove them from the oven and let them cool slightly.
**Step 8: Assemble your beetroot burgers by placing each patty on a burger bun and adding your favorite toppings.
**Step 9: Serve hot and enjoy your homemade beetroot burgers!'),
(34,4, 'Red pepper linguine', 'Red pepper linguine is a flavorful and vibrant dish that is sure to impress', 
'     • 8 oz (225g) linguine pasta
**     • 2 red bell peppers, roasted, peeled, and seeded
**     • 2 tablespoons olive oil
**     • 3 cloves garlic, minced
**     • 1 small onion, finely chopped
**     • 1/2 cup heavy cream or coconut cream (for a dairy-free option)
**     • Salt and pepper to taste
**     • Fresh basil leaves, chopped, for garnish
**     • Grated Parmesan cheese or nutritional yeast (for a vegan option), for garnish', 
'Step 1: Cook the linguine pasta according to the package instructions until al dente. Drain and set aside, reserving some pasta water.
**Step 2: In a blender or food processor, purée the roasted red bell peppers until smooth. Set aside.
**Step 3: In a large skillet, heat the olive oil over medium heat. Add the minced garlic and chopped onion, and sauté until softened and fragrant, about 2-3 minutes.
**Step 4: Pour the puréed red bell peppers into the skillet, stirring to combine with the garlic and onion.
**Step 5: Reduce the heat to low and add the heavy cream or coconut cream to the skillet, stirring continuously until the sauce is heated through.
**Step 6: Season the sauce with salt and pepper to taste.
**Step 7: Add the cooked linguine pasta to the skillet, tossing gently to coat the pasta with the red pepper sauce. If the sauce is too thick, you can add a splash of reserved pasta water to thin it out.
**Step 8: Cook for an additional 2-3 minutes, allowing the pasta to absorb the flavors of the sauce.
**Step 9: Once the pasta is heated through, remove the skillet from the heat.'),
(35,4,'Halloumi stuffed peppers', 'Halloumi-stuffed peppers are a delightful dish that combines the sweetness of peppers with the salty richness of halloumi cheese',
'     • 4 large bell peppers (any color you prefer)
**     • 1 block of halloumi cheese, sliced into strips
**     • 1 cup cooked quinoa or couscous
**     • 1 small red onion, finely chopped
**     • 2 cloves garlic, minced
**     • 1 tablespoon olive oil
**     • 1 teaspoon dried oregano
**     • 1 teaspoon paprika
**     • Salt and pepper to taste
**     • Fresh parsley, chopped, for garnish',
'Step 1: Preheat your oven to 375°F (190°C).
**Step 2: Cut the tops off the bell peppers and remove the seeds and membranes from the inside.
**Step 3: In a skillet, heat olive oil over medium heat. Add chopped onion and minced garlic, and sauté until softened and fragrant, about 2-3 minutes.
**Step 4: Add cooked quinoa or couscous to the skillet, along with dried oregano, paprika, salt, and pepper. Stir well to combine and cook for another 2-3 minutes. Remove from heat.
**Step 5: Stuff each bell pepper with the quinoa or couscous mixture, pressing it down gently.
**Step 6: Insert halloumi cheese strips into each pepper, ensuring they are evenly distributed throughout.
**Step 7: Place the stuffed peppers upright in a baking dish or on a baking sheet lined with parchment paper.
**Step 8: Bake in the preheated oven for 25-30 minutes, or until the peppers are tender and the halloumi cheese is golden brown and slightly crispy on the edges.
**Step 9: Once cooked, remove the stuffed peppers from the oven and let them cool slightly.
**Step 10: Garnish with chopped fresh parsley before serving.'),
(36,5, 'Cabbage soup', 'Cabbage soup is a comforting and nutritious dish that is easy to make.', 
'     • 1 small head of cabbage, shredded
**     • 2 carrots, diced
**     • 2 stalks of celery, diced
**     • 1 onion, chopped
**     • 3 cloves garlic, minced
**     • 1 can (14 oz) diced tomatoes
**     • 6 cups vegetable broth
**     • 1 teaspoon dried thyme
**     • 1 teaspoon dried oregano
**     • Salt and pepper to taste
**     • 2 tablespoons olive oil
**     • Optional: chopped fresh parsley for garnish', 
'Step 1: In a large pot or Dutch oven, heat olive oil over medium heat.
**Step 2: Add chopped onion and minced garlic to the pot, and sauté until the onion is translucent and fragrant, about 3-4 minutes.
**Step 3: Add diced carrots and celery to the pot, and continue to cook for another 3-4 minutes until they start to soften.
**Step 4: Stir in shredded cabbage and cook for an additional 5 minutes, allowing the cabbage to wilt slightly.
**Step 5: Pour in the diced tomatoes and vegetable broth, and add dried thyme and oregano. Season with salt and pepper to taste.
**Step 6: Bring the soup to a boil, then reduce the heat to low. Cover and simmer for about 20-25 minutes, or until all the vegetables are tender.
**Step 7: Taste and adjust the seasoning if needed.
**Step 8: Serve the cabbage soup hot, garnished with chopped fresh parsley if desired'),
(37,5,'Cabbage rice', 'Cabbage rice, also known as cabbage pulao or cabbage fried rice, is a flavorful and nutritious dish that is easy to make', 
'     • 1 cup basmati rice, rinsed and soaked for 30 minutes
**     • 2 cups shredded cabbage
**     • 1 onion, finely chopped
**     • 1 carrot, diced
**     • 1 bell pepper, diced (optional)
**     • 2 cloves garlic, minced
**     • 1-inch piece of ginger, minced
**     • 2 green chilies, finely chopped (adjust according to taste)
**     • 1 teaspoon cumin seeds
**     • 1 teaspoon turmeric powder
**     • 1 teaspoon garam masala (optional)
**     • Salt to taste
**     • 2 tablespoons cooking oil or ghee
**     • Fresh cilantro leaves, chopped, for garnish', 'Step 1: Heat oil or ghee in a large skillet or frying pan over medium heat.
**Step 2: Add cumin seeds to the hot oil and let them splutter.
**Step 3: Add chopped onions, minced garlic, minced ginger, and chopped green chilies to the skillet. Sauté until the onions turn translucent.
**Step 4: Add diced carrots and bell pepper (if using) to the skillet and cook for a few minutes until they start to soften.
**Step 5: Stir in shredded cabbage and cook for another 4-5 minutes until the cabbage is tender but still slightly crisp.
**Step 6: Drain the soaked rice and add it to the skillet. Stir well to combine with the vegetables.
**Step 7: Season with turmeric powder, garam masala (if using), and salt to taste. Mix until the rice and vegetables are evenly coated with the spices.
**Step 8: Pour in 2 cups of water and bring the mixture to a boil.
**Step 9: Once boiling, reduce the heat to low, cover the skillet with a lid, and simmer for about 15-20 minutes, or until the rice is cooked and all the water is absorbed.
**Step 10: Once the rice is cooked, remove the skillet from the heat and let it sit, covered, for a few minutes.
**Step 11: Fluff the cabbage rice with a fork and garnish with chopped cilantro leaves before serving.'),
(38,6,'Carrot soup', 'Carrot soup is a delightful and comforting dish, especially during colder months', 
'     • 1 tablespoon olive oil or butter
**     • 1 onion, chopped
**     • 2 cloves garlic, minced
**     • 1 lb (about 450g) carrots, peeled and chopped
**     • 4 cups vegetable broth or chicken broth
**     • 1 teaspoon ground cumin
**     • 1/2 teaspoon ground ginger
**     • Salt and pepper to taste
**     • Optional toppings: chopped fresh parsley, a dollop of Greek yogurt, or croutons', 'Step 1: Heat the olive oil or butter in a large pot over medium heat.
**Step 2: Add the chopped onion to the pot and sauté for 2-3 minutes until softened.
**Step 3: Add the minced garlic and cook for another 1-2 minutes until fragrant.
**Step 4: Add the chopped carrots to the pot and stir to combine with the onions and garlic.
**Step 5: Pour in the vegetable broth or chicken broth, ensuring that the carrots are fully submerged. Bring the mixture to a boil.
**Step 6: Once boiling, reduce the heat to low and simmer for about 20-25 minutes, or until the carrots are tender.
**Step 7: Using an immersion blender or a regular blender, blend the soup until smooth and creamy. Be careful when blending hot liquids.
**Step 8: Season the soup with ground cumin, ground ginger, salt, and pepper to taste. Adjust the seasoning according to your preference.
**Step 9: If the soup is too thick, you can add more broth or water to reach your desired consistency.
**Step 10: Serve the carrot soup hot, garnished with chopped fresh parsley, a dollop of Greek yogurt, or croutons if desired'),
(39,6, 'Candied carrots', 'Candied carrots make for a deliciously sweet and indulgent side dish.', 
'     • 1 lb (about 450g) carrots, peeled and sliced into thin rounds or sticks
**     • 1/4 cup (60g) unsalted butter
**     • 1/2 cup (100g) brown sugar
**     • 1/4 teaspoon ground cinnamon
**     • Pinch of salt', 'Step 1: In a large skillet or frying pan, melt the butter over medium heat.
**Step 2: Add the sliced carrots to the skillet and sauté for about 5 minutes, stirring occasionally, until they start to soften.
**Step 3: Sprinkle the brown sugar, ground cinnamon, and a pinch of salt over the carrots. Stir well to coat the carrots evenly with the sugar mixture.
**Step 4: Reduce the heat to low and continue to cook the carrots for another 10-15 minutes, stirring occasionally, until they are tender and caramelized.
**Step 5: Once the carrots are caramelized and coated with the sugar mixture, remove the skillet from the heat.
**Step 6: Transfer the candied carrots to a serving dish and garnish with chopped fresh parsley if desired.
**Step 7: Serve the candied carrots hot as a side dish or accompaniment to your main meal.'),
(40,7, 'Watermelon feta salad','Watermelon feta salad is a refreshing and delightful combination of sweet and savory flavors.', 
'     • 4 cups cubed seedless watermelon
**     • 1 cup crumbled feta cheese
**     • 1/4 cup thinly sliced red onion
**     • 1/4 cup fresh mint leaves, chopped
**     • 2 tablespoons extra virgin olive oil
**     • 1 tablespoon balsamic vinegar (or balsamic glaze)
**     • Salt and pepper to taste
', 'Step 1: In a large mixing bowl, combine the cubed watermelon, crumbled feta cheese, thinly sliced red onion, and chopped fresh mint leaves.
**Step 2: Drizzle the extra virgin olive oil and balsamic vinegar over the salad ingredients.
**Step 3: Gently toss the salad until all the ingredients are evenly coated with the dressing.
**Step 4: Season the salad with salt and pepper to taste, adjusting the seasoning according to your preference.
**Step 5: Transfer the watermelon feta salad to a serving dish or individual plates.
**Step 6: Optionally, garnish with additional fresh mint leaves for presentation.
**Step 7: Serve the salad immediately as a refreshing side dish or appetizer'), 
(41,7, 'Basil cucumber salad', 'Basil cucumber salad is a light and refreshing dish that is perfect for summer.', 
'     • 2 cucumbers, thinly sliced
**     • 1/4 cup fresh basil leaves, thinly sliced
**     • 2 tablespoons red onion, finely chopped (optional)
**     • 2 tablespoons extra virgin olive oil
**     • 1 tablespoon white wine vinegar or rice vinegar
**     • 1 teaspoon honey or sugar (optional)
**     • Salt and pepper to taste
**     • Optional garnish: crumbled feta cheese, chopped nuts (such as walnuts or almonds)', 'Step 1: In a large mixing bowl, combine the thinly sliced cucumbers, thinly sliced basil leaves, and finely chopped red onion (if using).
**Step 2: In a small bowl or measuring cup, whisk together the extra virgin olive oil, white wine vinegar, honey or sugar (if using), salt, and pepper to make the dressing.
**Step 3: Pour the dressing over the cucumber mixture in the large bowl.
**Step 4: Gently toss the salad until all the ingredients are evenly coated with the dressing.
**Step 5: Taste and adjust the seasoning if needed, adding more salt and pepper as desired.
**Step 6: Transfer the basil cucumber salad to a serving dish.
**Step 7: Optionally, garnish the salad with crumbled feta cheese or chopped nuts for added flavor and texture.
**Step 8: Serve the salad immediately as a refreshing side dish or accompaniment to your main meal.'),
(42,9, 'Caponata', 'Caponata is a traditional Sicilian dish that features eggplant, tomatoes, and other vegetables cooked in a sweet and sour sauce.', 
'     • 1 large eggplant, diced into 1-inch cubes
**     • 2 tablespoons olive oil
**     • 1 onion, chopped
**     • 2 cloves garlic, minced
**     • 1 bell pepper, diced
**     • 2 celery stalks, diced
**     • 1 can (14 oz) diced tomatoes
**     • 2 tablespoons tomato paste
**     • 2 tablespoons red wine vinegar
**     • 2 tablespoons capers, drained
**     • 1/4 cup green olives, sliced
**     • 2 tablespoons sugar
**     • Salt and pepper to taste
**     • Fresh basil leaves, chopped, for garnish
**     • Optional: toasted pine nuts or almonds for garnish', 'Step 1: In a large skillet or frying pan, heat the olive oil over medium heat.
**Step 2: Add the diced eggplant to the skillet and cook for about 5-7 minutes, stirring occasionally, until the eggplant is golden brown and softened. Remove the eggplant from the skillet and set aside.
**Step 3: In the same skillet, add a little more olive oil if needed, then add the chopped onion, minced garlic, diced bell pepper, and diced celery. Sauté for about 5 minutes until the vegetables are softened.
**Step 4: Add the diced tomatoes and tomato paste to the skillet, stirring to combine with the vegetables.
**Step 5: Return the cooked eggplant to the skillet, along with red wine vinegar, capers, sliced green olives, and sugar. Season with salt and pepper to taste.
**Step 6: Reduce the heat to low and let the caponata simmer for about 15-20 minutes, stirring occasionally, until the flavors meld together and the sauce thickens.
**Step 7: Taste and adjust the seasoning if needed, adding more salt, pepper, or sugar according to your preference.
**Step 8: Once cooked, remove the caponata from the heat and let it cool slightly.
**Step 9: Serve the caponata warm or at room temperature, garnished with chopped fresh basil leaves and toasted pine nuts or almonds if desired.
'),
(43,9, 'Miso eggplant', 'Miso eggplant, also known as Nasu Dengaku, is a popular Japanese dish where eggplant is grilled or broiled and then glazed with a sweet and savory miso sauce.', 
'     • 2 medium-sized Japanese eggplants or 1 large globe eggplant
**     • 2 tablespoons white miso paste
**     • 1 tablespoon mirin (Japanese sweet rice wine)
**     • 1 tablespoon soy sauce
**     • 1 tablespoon sake (Japanese rice wine) or dry white wine
**     • 1 tablespoon sugar (adjust to taste)
**     • Optional garnish: toasted sesame seeds, chopped green onions, or sliced scallions', 
'Step 1: Preheat your oven to broil setting or prepare a grill for medium-high heat.
**Step 2: Slice the eggplants in half lengthwise. Score the flesh of each half with a sharp knife in a crosshatch pattern, being careful not to cut through the skin.
**Step 3: Place the eggplant halves on a baking sheet lined with parchment paper or directly on the grill grates, cut side up.
**Step 4: In a small bowl, whisk together the white miso paste, mirin, soy sauce, sake or white wine, and sugar until well combined.
**Step 5: Brush the miso sauce generously over the cut side of each eggplant half.
**Step 6: Place the baking sheet with the eggplant under the broiler or on the grill and cook for about 10-15 minutes, or until the eggplant is tender and the miso sauce is caramelized and bubbly, rotating the baking sheet or turning the eggplant halfway through the cooking time to ensure even cooking.
**Step 7: Once cooked, remove the miso eggplant from the oven or grill and let it cool slightly.
**Step 8: Garnish with toasted sesame seeds, chopped green onions, or sliced scallions if desired.
**Step 9: Serve the miso eggplant warm as a side dish or appetizer.'),
(44,10, 'Lemon Tahini Dressing', '
Lemon tahini dressing is a creamy and tangy dressing that is perfect for salads, grain bowls, roasted vegetables, and more.', 
'     • 1/4 cup tahini (sesame seed paste)
**     • 1/4 cup freshly squeezed lemon juice
**     • 2 tablespoons water (plus more as needed)
**     • 1 tablespoon extra virgin olive oil
**     • 1 clove garlic, minced (optional)
**     • 1 teaspoon honey or maple syrup (optional, for sweetness)
**     • Salt and pepper to taste', 'Step 1: In a small mixing bowl, whisk together the tahini, freshly squeezed lemon juice, water, extra virgin olive oil, minced garlic (if using), and honey or maple syrup (if using) until smooth and creamy.
**Step 2: If the dressing is too thick, you can add more water, 1 tablespoon at a time, until you reach your desired consistency.
**Step 3: Season the dressing with salt and pepper to taste, adjusting the seasoning according to your preference.
**Step 4: Taste the dressing and adjust the acidity by adding more lemon juice if desired, or sweetness by adding more honey or maple syrup.
**Step 5: Once the dressing is well combined and seasoned to your liking, transfer it to a jar or airtight container for storage.
**Step 6: Store the lemon tahini dressing in the refrigerator for up to one week. Before using, give it a good stir or shake as it may separate over time.'),
(45,10, 'Vegetarian Marry Me Gnocchi', '"Vegetarian Marry Me Gnocchi" sounds like a fun and whimsical dish! Here is a recipe for a delicious vegetarian gnocchi dish that might just win someone heart', 
'     • 1 lb (450g) potato gnocchi
**     • 2 tablespoons olive oil
**     • 3 cloves garlic, minced
**     • 1 small onion, finely chopped
**     • 1 bell pepper, diced
**     • 1 zucchini, diced
**     • 1 cup cherry tomatoes, halved
**     • 1 cup baby spinach leaves
**     • 1/4 cup fresh basil leaves, chopped
**     • Salt and pepper to taste
**     • Grated Parmesan cheese or nutritional yeast for topping', 'Step 1: Cook the potato gnocchi according to the package instructions until they float to the surface of boiling water. Drain and set aside.
**Step 2: In a large skillet, heat the olive oil over medium heat. Add the minced garlic and chopped onion, and sauté until softened and fragrant, about 2-3 minutes.
**Step 3: Add the diced bell pepper and zucchini to the skillet, and cook for another 3-4 minutes until they start to soften.
**Step 4: Stir in the halved cherry tomatoes and cook for an additional 2-3 minutes until they release their juices.
**Step 5: Add the cooked gnocchi to the skillet, along with the baby spinach leaves and chopped fresh basil. Stir well to combine all the ingredients.
**Step 6: Season the gnocchi and vegetables with salt and pepper to taste, adjusting the seasoning according to your preference.
**Step 7: Cook for another 2-3 minutes, stirring occasionally, until the spinach wilts and the gnocchi are heated through.
**Step 8: Once cooked, remove the skillet from the heat.
**Step 9: Serve the vegetarian marry me gnocchi hot, topped with grated Parmesan cheese or nutritional yeast for added flavor.'),
(46,11, 'Roasted grape crostini', 'Roasted grape crostini is a delightful appetizer that combines the sweetness of roasted grapes with creamy cheese and crusty bread.', 
'     • 1 baguette, sliced into 1/2-inch thick rounds
**     • 2 cups seedless red grapes
**     • 2 tablespoons olive oil
**     • 1 tablespoon balsamic vinegar
**     • 4 oz (113g) goat cheese or cream cheese
**     • Fresh thyme leaves, for garnish
**     • Honey, for drizzling (optional)
**     • Salt and pepper to taste', 
'Step 1: Preheat your oven to 400°F (200°C).
**Step 2: Place the baguette slices on a baking sheet lined with parchment paper. Drizzle with a little olive oil and season with salt and pepper.
**Step 3: In a mixing bowl, toss the red grapes with olive oil and balsamic vinegar until evenly coated.
**Step 4: Spread the grapes out on a separate baking sheet lined with parchment paper.
**Step 5: Place both the baguette slices and the grapes in the preheated oven. Bake the baguette slices for about 8-10 minutes, or until golden and crisp. Roast the grapes for about 15-20 minutes, or until they start to soften and caramelize.
**Step 6: Once the baguette slices and grapes are cooked, remove them from the oven and let them cool slightly.
**Step 7: To assemble the crostini, spread a layer of goat cheese or cream cheese onto each baguette slice.
**Step 8: Top each crostini with a few roasted grapes, pressing them gently into the cheese.'),
(47,11, 'Frozen yogurt dipped grapes', 'Frozen yogurt dipped grapes are a refreshing and healthy snack that is perfect for hot summer days. Here is how you can make them:', 
'     • 1 lb (about 450g) seedless grapes, washed and dried
**     • 1 cup Greek yogurt (plain or flavored)
**     • 2 tablespoons honey or maple syrup (optional, for sweetness)
**     • 1/2 teaspoon vanilla extract (optional, for flavor)
**     • Toppings of your choice: chopped nuts, shredded coconut, mini chocolate chips, etc.', 
'Step 1: Line a baking sheet with parchment paper or wax paper.
**Step 2: In a small bowl, whisk together the Greek yogurt, honey or maple syrup (if using), and vanilla extract (if using) until smooth.
**Step 3: Spear each grape with a toothpick or skewer, leaving the top exposed for dipping.
**Step 4: Dip each grape into the Greek yogurt mixture, coating it evenly with a thin layer of yogurt.
**Step 5: Allow any excess yogurt to drip off, then place the dipped grape onto the prepared baking sheet.
**Step 6: Repeat the dipping process with the remaining grapes.
**Step 7: If desired, sprinkle your choice of toppings over the yogurt-covered grapes while they are still wet.
**Step 8: Once all the grapes are dipped and topped, place the baking sheet in the freezer.
**Step 9: Freeze the yogurt-covered grapes for at least 2-3 hours, or until the yogurt is firm and set.
**Step 10: Once frozen, remove the grapes from the baking sheet and transfer them to a freezer-safe container or resealable plastic bag for storage.
**Step 11: Serve the frozen yogurt dipped grapes straight from the freezer as a refreshing and healthy snack.'),
(48,12, 'Lemon chicken pasta', 'Lemon chicken pasta is a flavorful and comforting dish that combines tender chicken with a zesty lemon sauce.', 
'     • 8 oz (225g) pasta of your choice (linguine, fettuccine, or spaghetti work well)
**     • 2 boneless, skinless chicken breasts, cut into bite-sized pieces
**     • Salt and pepper to taste
**     • 2 tablespoons olive oil
**     • 3 cloves garlic, minced
**     • Zest of 1 lemon
**     • Juice of 1 lemon
**     • 1 cup chicken broth
**     • 1/2 cup heavy cream or half-and-half
**     • 1/4 cup grated Parmesan cheese
**     • 2 tablespoons chopped fresh parsley
**     • Optional: red pepper flakes for heat, additional grated Parmesan for serving', 
'Step 1: Cook the pasta according to the package instructions in a pot of salted boiling water until al dente. Drain and set aside, reserving 1/2 cup of pasta water.
**Step 2: Season the chicken breast pieces with salt and pepper to taste.
**Step 3: In a large skillet, heat the olive oil over medium-high heat. Add the seasoned chicken pieces and cook until golden brown and cooked through, about 5-7 minutes per side. Remove the chicken from the skillet and set aside.
**Step 4: In the same skillet, add minced garlic and cook for about 1 minute until fragrant.
**Step 5: Add lemon zest and lemon juice to the skillet, stirring to combine with the garlic.
**Step 6: Pour in chicken broth and bring to a simmer, scraping up any browned bits from the bottom of the skillet.
**Step 7: Reduce the heat to low and stir in heavy cream or half-and-half. Simmer for 2-3 minutes until the sauce begins to thicken slightly.
**Step 8: Stir in grated Parmesan cheese until melted and smooth.
**Step 9: Add cooked pasta to the skillet, tossing to coat evenly with the lemon cream sauce. If the sauce is too thick, you can add some reserved pasta water to thin it out.
**Step 10: Return the cooked chicken to the skillet, stirring to combine with the pasta and sauce.
**Step 11: Season with salt and pepper to taste, and add red pepper flakes if desired for heat.
**Step 12: Garnish the lemon chicken pasta with chopped fresh parsley and additional grated Parmesan cheese before serving.'),
(49,12, 'Lemon cheesecake bars', '
Lemon cheesecake bars are a delightful and tangy dessert that combines the creamy richness of cheesecake with the bright flavor of lemon.', 
'- For the Crust:
**     • 1 1/2 cups graham cracker crumbs
**     • 1/4 cup granulated sugar
**     • 1/2 cup unsalted butter, melted
- For the Cheesecake Filling:
**     • 16 oz (450g) cream cheese, softened
**     • 1/2 cup granulated sugar
**     • 2 large eggs
**     • 1/4 cup fresh lemon juice
**     • Zest of 1 lemon
**     • 1 teaspoon vanilla extract
- For the Lemon Topping:
**     • 1/2 cup powdered sugar
**     • 2 tablespoons fresh lemon juice
**     • Zest of 1 lemon
**     • Optional: additional powdered sugar for dusting', 'Step 1: Preheat your oven to 350°F (175°C). Line an 8x8-inch baking dish with parchment paper, leaving an overhang on the sides for easy removal.
**Step 2: In a mixing bowl, combine the graham cracker crumbs, granulated sugar, and melted butter for the crust. Mix until the crumbs are evenly moistened.
**Step 3: Press the crumb mixture firmly into the bottom of the prepared baking dish to form an even layer.
**Step 4: In another mixing bowl, beat the softened cream cheese and granulated sugar together until smooth and creamy.
**Step 5: Add the eggs, one at a time, beating well after each addition.
**Step 6: Mix in the fresh lemon juice, lemon zest, and vanilla extract until well combined.
**Step 7: Pour the cheesecake filling over the prepared crust, spreading it into an even layer.
**Step 8: Bake in the preheated oven for 25-30 minutes, or until the edges are set and the center is slightly jiggly.
**Step 9: Remove the cheesecake bars from the oven and let them cool completely in the baking dish on a wire rack.
**Step 10: Once cooled, refrigerate the cheesecake bars for at least 2 hours or until well chilled.
**Step 11: In a small bowl, whisk together the powdered sugar and fresh lemon juice until smooth to make the lemon topping.
**Step 12: Drizzle the lemon topping over the chilled cheesecake bars, then sprinkle with lemon zest.
**Step 13: Optionally, dust the top with additional powdered sugar for decoration.
**Step 14: Use the parchment paper overhang to lift the cheesecake bars out of the baking dish, then slice into squares.
**Step 15: Serve the lemon cheesecake bars chilled and enjoy!'),
(50,13, 'Mango salsa', 'Mango salsa is a refreshing and flavorful condiment that pairs well with grilled meats, fish tacos, or as a dip for tortilla chips.', 
'     • 2 ripe mangoes, peeled, pitted, and diced
**     • 1/2 red onion, finely chopped
**     • 1 red bell pepper, diced
**     • 1 jalapeño pepper, seeded and minced (adjust to taste)
**     • 1/4 cup fresh cilantro leaves, chopped
**     • Juice of 1 lime
**     • Salt and pepper to taste', 
'Step 1: In a medium-sized mixing bowl, combine the diced mangoes, finely chopped red onion, diced red bell pepper, minced jalapeño pepper, and chopped cilantro leaves.
**Step 2: Squeeze the juice of one lime over the mixture.
**Step 3: Season the salsa with salt and pepper to taste.
**Step 4: Gently toss all the ingredients together until well combined.
**Step 5: Taste the salsa and adjust the seasoning or lime juice if needed.
**Step 6: Refrigerate the mango salsa for at least 30 minutes to allow the flavors to meld together.
**Step 7: Serve the mango salsa chilled as a topping for grilled chicken, fish, or tacos, or as a dip for tortilla chips.'),
(51,13, 'Shrimp tacos with mango salsa', 'Mango salsa is a refreshing and flavorful condiment that pairs well with grilled meats, fish tacos, or as a dip for tortilla chips.', 
'     • 2 ripe mangoes, peeled, pitted, and diced
**     • 1/2 red onion, finely chopped
**     • 1 red bell pepper, diced
**     • 1 jalapeño pepper, seeded and minced (adjust to taste)
**     • 1/4 cup fresh cilantro leaves, chopped
**     • Juice of 1 lime
**     • Salt and pepper to taste', 
'Step 1: In a medium-sized mixing bowl, combine the diced mangoes, finely chopped red onion, diced red bell pepper, minced jalapeño pepper, and chopped cilantro leaves.
**Step 2: Squeeze the juice of one lime over the mixture.
**Step 3: Season the salsa with salt and pepper to taste.
**Step 4: Gently toss all the ingredients together until well combined.
**Step 5: Taste the salsa and adjust the seasoning or lime juice if needed.
**Step 6: Refrigerate the mango salsa for at least 30 minutes to allow the flavors to meld together.
**Step 7: Serve the mango salsa chilled as a topping for grilled chicken, fish, or tacos, or as a dip for tortilla chips.'),
(52,14, 'Pork dumpling with Napa cabbage', 'Pork dumplings with Napa cabbage is a classic and delicious dish in many Asian cuisines.',	 
'- For the Dumplings:
**     • 1 lb (450g) ground pork
**     • 2 cups Napa cabbage, finely chopped
**     • 3 green onions, finely chopped
**     • 2 cloves garlic, minced
**     • 1 tablespoon fresh ginger, grated
**     • 1 tablespoon soy sauce
**     • 1 tablespoon sesame oil
**     • 1 teaspoon sugar
**     • 1/2 teaspoon salt
**     • 1/4 teaspoon black pepper
**     • 30-40 round dumpling wrappers
- For Dipping Sauce (optional):
**     • 1/4 cup soy sauce
**     • 2 tablespoons rice vinegar
**     • 1 tablespoon sesame oil
**     • 1 teaspoon sugar
**     • 1 teaspoon chili garlic sauce (optional, for heat)', 'Step 1: In a large mixing bowl, combine the ground pork, finely chopped Napa cabbage, chopped green onions, minced garlic, grated ginger, soy sauce, sesame oil, sugar, salt, and black pepper. Mix well until all the ingredients are evenly incorporated.
**Step 2: To assemble the dumplings, place a small spoonful of the pork-cabbage filling in the center of each dumpling wrapper. Moisten the edges of the wrapper with water, then fold and pleat to seal the dumplings. Repeat until all the filling is used.
**Step 3: In a large skillet or frying pan, heat a tablespoon of oil over medium-high heat. Place the dumplings in the skillet in a single layer, making sure they are not touching each other. Cook until the bottoms are golden brown, about 2-3 minutes.
**Step 4: Once the bottoms are browned, add 1/4 cup of water to the skillet and immediately cover with a lid. Steam the dumplings for about 5-7 minutes, or until the filling is cooked through and the wrappers are translucent.
**Step 5: While the dumplings are cooking, prepare the dipping sauce by combining soy sauce, rice vinegar, sesame oil, sugar, and chili garlic sauce (if using) in a small bowl. Stir until the sugar is dissolved.
**Step 6: Once the dumplings are cooked, remove them from the skillet and serve hot with the dipping sauce on the side.'),
(53,14, 'Charred cabbage and carrots', '
Charred cabbage and carrots make for a flavorful and nutritious side dish or addition to salads and bowls.', 
'     • 1 small head of cabbage, sliced into wedges
**     • 4-6 carrots, peeled and sliced lengthwise
**     • 2 tablespoons olive oil
**     • Salt and pepper to taste
**     • Optional: garlic powder, smoked paprika, or your favorite herbs and spices for seasoning', 
'Step 1: Preheat your grill or grill pan to medium-high heat.
**Step 2: In a large bowl, toss the cabbage wedges and carrot slices with olive oil until evenly coated.
**Step 3: Season the vegetables with salt, pepper, and any additional herbs or spices of your choice, such as garlic powder or smoked paprika.
**Step 4: Once the grill is hot, place the cabbage wedges and carrot slices directly onto the grill grates.
**Step 5: Grill the vegetables for about 4-5 minutes on each side, or until they are charred and tender.
**Step 6: Use a pair of tongs to carefully flip the vegetables halfway through the cooking time to ensure even charring.
**Step 7: Once the cabbage and carrots are charred to your liking, remove them from the grill and transfer to a serving platter.
**Step 8: Serve the charred cabbage and carrots hot as a side dish or let them cool slightly before adding them to salads or bowls.'),
(54,15, 'Charred cabbage and carrots', 'Charred cabbage and carrots make for a flavorful and nutritious side dish or addition to salads and bowls.', 
'     • 1 small head of cabbage, sliced into wedges
**     • 4-6 carrots, peeled and sliced lengthwise
**     • 2 tablespoons olive oil
**     • Salt and pepper to taste
**     • Optional: garlic powder, smoked paprika, or your favorite herbs and spices for seasoning', 
'Step 1: Preheat your grill or grill pan to medium-high heat.
**Step 2: In a large bowl, toss the cabbage wedges and carrot slices with olive oil until evenly coated.
**Step 3: Season the vegetables with salt, pepper, and any additional herbs or spices of your choice, such as garlic powder or smoked paprika.
**Step 4: Once the grill is hot, place the cabbage wedges and carrot slices directly onto the grill grates.
**Step 5: Grill the vegetables for about 4-5 minutes on each side, or until they are charred and tender.
**Step 6: Use a pair of tongs to carefully flip the vegetables halfway through the cooking time to ensure even charring.
**Step 7: Once the cabbage and carrots are charred to your liking, remove them from the grill and transfer to a serving platter.
**Step 8: Serve the charred cabbage and carrots hot as a side dish or let them cool slightly before adding them to salads or bowls.'),
(55,16, 'Ambrosia salad', 'Ambrosia salad is a classic American fruit salad that typically includes a combination of fruits, marshmallows, coconut, and sometimes nuts, all bound together with a creamy dressing.', 
'     • 2 cups mandarin oranges, drained (from a can)
**     • 2 cups pineapple chunks, drained (from a can)
**     • 2 cups shredded coconut
**     • 2 cups mini marshmallows
**     • 1 cup maraschino cherries, drained and halved
**     • 1 cup sour cream or Greek yogurt
**     • 1 cup whipped cream or whipped topping
**     • 1/2 cup chopped pecans or walnuts (optional)
**     • 1 tablespoon honey or maple syrup (optional, for sweetness)
**     • 1 teaspoon vanilla extract
**     • 2 tablespoons chopped fresh parsley', 'Step 1: In a large mixing bowl, combine the mandarin oranges, pineapple chunks, shredded coconut, mini marshmallows, and halved maraschino cherries.
**Step 2: In a separate bowl, mix together the sour cream or Greek yogurt, whipped cream or whipped topping, honey or maple syrup (if using), and vanilla extract until well combined.
**Step 3: Pour the creamy dressing over the fruit mixture in the large bowl.
**Step 4: Gently fold all the ingredients together until the fruits and marshmallows are evenly coated with the creamy dressing.
**Step 5: If using chopped nuts, sprinkle them over the top of the salad and gently stir to incorporate.
**Step 6: Cover the bowl with plastic wrap and refrigerate the ambrosia salad for at least 1-2 hours before serving to allow the flavors to meld together.
**Step 7: Before serving, give the salad a gentle stir and adjust the sweetness if needed by adding more honey or maple syrup.
**Step 8: Serve the ambrosia salad chilled as a refreshing side dish or dessert.' ),
(56,16, 'Citrus avocado salad', 'Citrus avocado salad is a vibrant and refreshing salad that combines the creamy texture of avocado with the tangy sweetness of citrus fruits, all tossed in a zesty vinaigrette dressing.',
'     • 2 ripe avocados, peeled, pitted, and sliced
**     • 2 oranges, peeled and segmented
**     • 1 grapefruit, peeled and segmented
**     • 1/4 red onion, thinly sliced
**     • 1/4 cup fresh cilantro leaves, chopped
**     • 2 tablespoons extra virgin olive oil
**     • 1 tablespoon fresh lime juice
**     • 1 teaspoon honey or maple syrup (optional)
**     • Salt and pepper to taste', 'Step 1: In a large salad bowl, combine the sliced avocados, orange segments, grapefruit segments, thinly sliced red onion, and chopped cilantro leaves.
**Step 2: In a small bowl, whisk together the extra virgin olive oil, fresh lime juice, honey or maple syrup, salt, and pepper to make the vinaigrette dressing.
**Step 3: Drizzle the vinaigrette dressing over the salad ingredients in the large bowl.
**Step 4: Gently toss all the ingredients together until the avocado and citrus fruits are evenly coated with the dressing.
**Step 5: Taste the salad and adjust the seasoning if needed, adding more salt, pepper, or lime juice according to your preference.
**Step 6: Serve the citrus avocado salad immediately as a refreshing side dish or light appetizer, garnished with additional cilantro leaves if desired.'),
(57,17, 'Peach bruschetta', 'Peach bruschetta is a delightful twist on the classic Italian appetizer, featuring the sweetness of ripe peaches combined with savory flavors on toasted bread slices.',
'     • 4 ripe peaches, diced
**     • 1/4 cup red onion, finely chopped
**     • 1/4 cup fresh basil leaves, chopped
**     • 1 tablespoon balsamic vinegar
**     • 1 tablespoon honey
**     • Salt and pepper to taste
**     • Baguette, sliced
**     • Olive oil', 'Step 1: In a medium mixing bowl, combine the diced peaches, halved cherry tomatoes, and finely chopped red onion.
**Step 2: Drizzle balsamic vinegar and extra virgin olive oil over the mixture.
**Step 3: Add fresh basil slices and season with salt and pepper according to your taste.
**Step 4: Gently toss all the ingredients until well combined.
**Step 5: Arrange the toasted bread slices on a serving platter or tray.
**Step 6: Spoon the peach and tomato mixture generously onto each slice of toasted bread.
**Step 7: Serve the peach bruschetta immediately as a delicious appetizer, perfect for summer gatherings or any occasion.'),
(58,18, 'Mashed potato biscuits', 'Mashed potato biscuits are fluffy and tender biscuits made with the addition of creamy mashed potatoes, perfect for breakfast or as a side dish for any meal.',
'     • 1 cup mashed potatoes, cooled
**     • 2 cups all-purpose flour
**     • 1 tablespoon baking powder
**     • 1 teaspoon salt
**     • 1/2 cup unsalted butter, cold and cut into cubes
**     • 1/2 cup milk
**     • 2 tablespoons honey or sugar (optional)', 'Step 1: Preheat your oven to 425°F (220°C). Line a baking sheet with parchment paper or lightly grease it.
**Step 2: In a large mixing bowl, combine the all-purpose flour, baking powder, and salt.
**Step 3: Add the cold cubed butter to the dry ingredients. Use a pastry cutter or your fingers to cut the butter into the flour mixture until it resembles coarse crumbs.
**Step 4: In a separate bowl, mix together the mashed potatoes and milk. If desired, add honey or sugar for sweetness.
**Step 5: Pour the mashed potato mixture into the dry ingredients and stir until just combined. Be careful not to overmix.
**Step 6: Turn the dough out onto a lightly floured surface and gently knead it a few times until it comes together.
**Step 7: Roll out the dough to about 1-inch thickness. Use a biscuit cutter or a drinking glass to cut out biscuits.
**Step 8: Place the biscuits onto the prepared baking sheet, leaving some space between each biscuit.
**Step 9: Bake in the preheated oven for 12 to 15 minutes, or until the biscuits are golden brown on top.
**Step 10: Remove from the oven and let the biscuits cool slightly before serving.
**Step 11: Enjoy these fluffy mashed potato biscuits warm with butter or your favorite jam!'),
(59,18, 'Twice baked potatoes', 'Twice baked potatoes are a delicious and indulgent side dish made by baking potatoes, scooping out the flesh, mixing it with flavorful ingredients, then baking them again until golden and crispy.',
'     • 4 large russet potatoes
**     • 4 slices bacon, cooked and crumbled
**     • 1/2 cup sour cream
**     • 1/2 cup shredded cheddar cheese
**     • 2 tablespoons unsalted butter
**     • 2 green onions, thinly sliced
**     • Salt and pepper to taste
**     • Chopped fresh chives for garnish (optional)', 'Step 1: Preheat your oven to 400°F (200°C). Wash the potatoes and pierce them several times with a fork.
**Step 2: Place the potatoes directly on the oven rack and bake for 45 to 60 minutes, or until they are fork-tender.
**Step 3: Remove the potatoes from the oven and let them cool slightly until they are safe to handle.
**Step 4: Slice off the top third of each potato lengthwise. Carefully scoop out the flesh from the potatoes into a mixing bowl, leaving a thin shell intact.
**Step 5: Mash the potato flesh in the mixing bowl. Add the cooked and crumbled bacon, sour cream, shredded cheddar cheese, unsalted butter, and thinly sliced green onions. Season with salt and pepper to taste. Mix until well combined.
**Step 6: Spoon the mashed potato mixture back into the potato shells, dividing it evenly among them.
**Step 7: Place the stuffed potatoes on a baking sheet lined with parchment paper.
**Step 8: Bake in the preheated oven for an additional 20 to 25 minutes, or until the tops are golden and the filling is heated through.
**Step 9: Remove from the oven and let the twice baked potatoes cool for a few minutes before serving.
**Step 10: Garnish with chopped fresh chives if desired, and enjoy these cheesy, flavorful potatoes as a satisfying side dish!'), 
(60,19, 'Spinach and radish salad with feta', 'Spinach and radish salad with feta is a vibrant and nutritious salad featuring fresh baby spinach leaves, crunchy radishes, creamy feta cheese, and a tangy vinaigrette dressing.',
'     • 4 cups baby spinach leaves, washed and dried
**     • 1 cup radishes, thinly sliced
**     • 1/2 cup crumbled feta cheese
**     • 1/4 cup sliced almonds, toasted
**     • 2 tablespoons extra virgin olive oil
**     • 1 tablespoon balsamic vinegar
**     • 1 teaspoon Dijon mustard
**     • 1 teaspoon honey
**     • Salt and pepper to taste', 'Step 1: In a large salad bowl, combine the baby spinach leaves and thinly sliced radishes.
**Step 2: In a small bowl, whisk together the extra virgin olive oil, balsamic vinegar, Dijon mustard, honey, salt, and pepper to make the vinaigrette dressing.
**Step 3: Drizzle the vinaigrette dressing over the spinach and radish mixture in the salad bowl.
**Step 4: Gently toss all the ingredients together until the spinach and radishes are evenly coated with the dressing.
**Step 5: Sprinkle the crumbled feta cheese and toasted sliced almonds over the top of the salad.
**Step 6: Serve the spinach and radish salad with feta immediately as a refreshing and nutritious side dish or light lunch option.
**Step 7: Enjoy the combination of flavors and textures in this delicious salad!'),
(61,19, 'Miso buttered radishes', 'Miso buttered radishes are a flavorful and unique dish that combines the crispiness of radishes with the savory umami taste of miso butter, creating a delightful appetizer or side dish.',
'     • 1 bunch radishes, trimmed and halved
**     • 2 tablespoons unsalted butter, softened
**     • 1 tablespoon white miso paste
**     • 1 teaspoon honey
**     • 1 tablespoon chopped fresh chives
**     • Salt and pepper to taste
**     • Sesame seeds for garnish (optional)', 'Step 1: Preheat your oven to 400°F (200°C). Line a baking sheet with parchment paper.
**Step 2: In a small bowl, mix together the softened unsalted butter, white miso paste, honey, chopped fresh chives, salt, and pepper until well combined.
**Step 3: Spread the miso butter mixture over the cut sides of the radishes.
**Step 4: Place the buttered radishes, cut side down, on the prepared baking sheet.
**Step 5: Bake in the preheated oven for 15 to 20 minutes, or until the radishes are tender and slightly caramelized.
**Step 6: Remove from the oven and transfer the miso buttered radishes to a serving plate.
**Step 7: Garnish with sesame seeds if desired.
**Step 8: Serve the miso buttered radishes warm as a unique and flavorful appetizer or side dish.
**Step 9: Enjoy the delicious combination of crispy radishes and savory miso butter!'),
(62,21, 'Cherry tomato pasta', 'Cherry tomato pasta is a simple yet flavorful dish featuring sweet cherry tomatoes cooked with garlic, olive oil, and herbs, then tossed with al dente pasta for a quick and satisfying meal.',
'     • 8 ounces pasta of your choice (such as spaghetti or penne)
**     • 2 cups cherry tomatoes, halved
**     • 3 cloves garlic, minced
**     • 1/4 cup extra virgin olive oil
**     • 1/4 teaspoon red pepper flakes (optional)
**     • Salt and pepper to taste
**     • Fresh basil leaves, thinly sliced, for garnish
**     • Grated Parmesan cheese, for serving (optional)', 'Step 1: Cook the pasta according to the package instructions until it is al dente. Drain and set aside, reserving some pasta water.
**Step 2: While the pasta is cooking, heat the olive oil in a large skillet over medium heat. Add the minced garlic and cook for 1-2 minutes, or until fragrant.
**Step 3: Add the halved cherry tomatoes to the skillet, along with the red pepper flakes if using. Cook for 5-7 minutes, stirring occasionally, until the tomatoes start to soften and release their juices.
**Step 4: Season the cherry tomatoes with salt and pepper to taste.
**Step 5: Add the cooked pasta to the skillet with the cherry tomatoes. Toss everything together gently, adding a splash of reserved pasta water if needed to loosen the sauce.
**Step 6: Cook for another 1-2 minutes, allowing the flavors to meld together.
**Step 7: Remove from heat and garnish with thinly sliced fresh basil leaves.
**Step 8: Serve the cherry tomato pasta immediately, with grated Parmesan cheese on top if desired.
**Step 9: Enjoy this quick and delicious pasta dish as a satisfying weeknight meal!'),
(63,21, 'Tomato tart', 'Tomato tart is a delightful savory pastry dish that showcases the vibrant flavors of ripe tomatoes, fragrant herbs, and creamy cheese atop a flaky crust, perfect for a light lunch or appetizer.',
'     • 1 sheet frozen puff pastry, thawed
**     • 2 large tomatoes, sliced
**     • 1/2 cup shredded mozzarella cheese
**     • 1/4 cup grated Parmesan cheese
**     • 2 tablespoons fresh basil, thinly sliced
**     • 1 tablespoon olive oil
**     • 1 clove garlic, minced
**     • Salt and pepper to taste', 'Step 1: Preheat your oven to 400°F (200°C). Line a baking sheet with parchment paper.
**Step 2: Roll out the thawed puff pastry sheet on a lightly floured surface into a rectangular shape.
**Step 3: Transfer the rolled-out pastry dough to the prepared baking sheet.
**Step 4: In a small bowl, mix together the minced garlic and olive oil. Brush the garlic-infused oil over the surface of the pastry dough.
**Step 5: Sprinkle half of the shredded mozzarella cheese evenly over the pastry dough.
**Step 6: Arrange the sliced tomatoes on top of the cheese in a single layer, slightly overlapping them.
**Step 7: Season the tomatoes with salt and pepper to taste.
**Step 8: Sprinkle the remaining shredded mozzarella cheese and grated Parmesan cheese over the tomatoes.
**Step 9: Bake in the preheated oven for 20-25 minutes, or until the pastry is golden brown and the cheese is bubbly and melted.
**Step 10: Remove from the oven and let the tomato tart cool for a few minutes.
**Step 11: Sprinkle the thinly sliced fresh basil over the tart before serving.
**Step 12: Cut the tomato tart into slices and serve warm as a delicious appetizer or light lunch option.
**Step 13: Enjoy the combination of flaky pastry, juicy tomatoes, and melted cheese in this delightful tomato tart!'),
(64,22, 'Creamed turnip', 'Creamed turnip is a comforting and flavorful side dish made with tender turnips cooked in a creamy sauce, seasoned with herbs and spices, perfect for a cozy family dinner or holiday meal.',
'     • 4 large turnips, peeled and diced
**     • 2 tablespoons unsalted butter
**     • 2 tablespoons all-purpose flour
**     • 1 cup milk
**     • 1/2 cup heavy cream
**     • 1/4 teaspoon ground nutmeg
**     • Salt and pepper to taste
**     • Fresh parsley, chopped, for garnish', 'Step 1: Place the diced turnips in a large pot and cover them with water. Bring to a boil over medium-high heat and cook until the turnips are fork-tender, about 15-20 minutes.
**Step 2: Drain the cooked turnips and set them aside.
**Step 3: In the same pot, melt the unsalted butter over medium heat. Sprinkle the flour over the melted butter and whisk constantly for 1-2 minutes to create a roux.
**Step 4: Gradually pour in the milk and heavy cream, whisking constantly to prevent lumps from forming.
**Step 5: Cook the sauce, stirring frequently, until it thickens and coats the back of a spoon, about 5 minutes.
**Step 6: Stir in the ground nutmeg, salt, and pepper to taste.
**Step 7: Add the cooked turnips to the creamy sauce, stirring gently to coat them evenly.
**Step 8: Cook for an additional 2-3 minutes, allowing the flavors to meld together.
**Step 9: Remove from heat and transfer the creamed turnip to a serving dish.
**Step 10: Garnish with chopped fresh parsley before serving.
**Step 11: Enjoy this creamy and delicious turnip side dish alongside your favorite main course!'),
(66,22, 'Roasted turnips and radishes', 'Roasted turnips and radishes make for a flavorful and nutritious side dish, with tender vegetables caramelized to perfection and seasoned with herbs and spices, adding a delicious twist to your dinner table.',
'     • 4 turnips, peeled and cut into wedges
**     • 1 bunch radishes, trimmed and halved
**     • 2 tablespoons olive oil
**     • 2 cloves garlic, minced
**     • 1 teaspoon dried thyme
**     • 1 teaspoon dried rosemary
**     • Salt and pepper to taste
**     • Fresh parsley, chopped, for garnish', 'Step 1: Preheat your oven to 400°F (200°C). Line a baking sheet with parchment paper.
**Step 2: In a large mixing bowl, combine the turnip wedges and halved radishes.
**Step 3: Drizzle the olive oil over the vegetables, then add the minced garlic, dried thyme, dried rosemary, salt, and pepper. Toss until the vegetables are evenly coated with the seasonings.
**Step 4: Spread the seasoned turnips and radishes in a single layer on the prepared baking sheet.
**Step 5: Roast in the preheated oven for 25-30 minutes, or until the vegetables are tender and caramelized, stirring halfway through the cooking time for even browning.
**Step 6: Remove from the oven and transfer the roasted turnips and radishes to a serving dish.
**Step 7: Garnish with chopped fresh parsley before serving.
**Step 8: Enjoy these roasted vegetables as a delicious and nutritious side dish with your favorite main course!'),
(67,19, 'Roasted turnips and radishes', 'Roasted turnips and radishes make for a flavorful and nutritious side dish, with tender vegetables caramelized to perfection and seasoned with herbs and spices, adding a delicious twist to your dinner table.',
'     • 4 turnips, peeled and cut into wedges
**     • 1 bunch radishes, trimmed and halved
**     • 2 tablespoons olive oil
**     • 2 cloves garlic, minced
**     • 1 teaspoon dried thyme
**     • 1 teaspoon dried rosemary
**     • Salt and pepper to taste
**     • Fresh parsley, chopped, for garnish', 'Step 1: Preheat your oven to 400°F (200°C). Line a baking sheet with parchment paper.
**Step 2: In a large mixing bowl, combine the turnip wedges and halved radishes.
**Step 3: Drizzle the olive oil over the vegetables, then add the minced garlic, dried thyme, dried rosemary, salt, and pepper. Toss until the vegetables are evenly coated with the seasonings.
**Step 4: Spread the seasoned turnips and radishes in a single layer on the prepared baking sheet.
**Step 5: Roast in the preheated oven for 25-30 minutes, or until the vegetables are tender and caramelized, stirring halfway through the cooking time for even browning.
**Step 6: Remove from the oven and transfer the roasted turnips and radishes to a serving dish.
**Step 7: Garnish with chopped fresh parsley before serving.
**Step 8: Enjoy these roasted vegetables as a delicious and nutritious side dish with your favorite main course!'),
(68,23, 'Stuffed zucchini', 'Stuffed zucchini is a delicious and versatile dish where hollowed-out zucchini halves are filled with a flavorful mixture, baked until tender, and topped with cheese for a satisfying meal or appetizer.',
'     • 4 medium zucchini
**     • 1 tablespoon olive oil
**     • 1 small onion, finely chopped
**     • 2 cloves garlic, minced
**     • 1 bell pepper, diced
**     • 1 cup cooked quinoa or rice
**     • 1 cup diced tomatoes
**     • 1/2 cup cooked black beans
**     • 1 teaspoon ground cumin
**     • 1 teaspoon chili powder
**     • Salt and pepper to taste
**     • 1/2 cup shredded cheddar cheese
**     • Fresh cilantro, chopped, for garnish', 'Step 1: Preheat your oven to 375°F (190°C). Grease a baking dish with olive oil or non-stick spray.
**Step 2: Cut each zucchini in half lengthwise, then use a spoon to scoop out the flesh, leaving about 1/4-inch thick shells. Chop the scooped-out zucchini flesh and set aside.
**Step 3: Heat olive oil in a large skillet over medium heat. Add the chopped onion and bell pepper, and cook until softened, about 5 minutes.
**Step 4: Add the minced garlic, chopped zucchini flesh, cooked quinoa or rice, diced tomatoes, cooked black beans, ground cumin, chili powder, salt, and pepper to the skillet. Cook for another 5 minutes, stirring occasionally, until heated through and well combined.
**Step 5: Fill each hollowed-out zucchini half with the quinoa mixture, pressing down gently to pack it in.
**Step 6: Place the stuffed zucchini halves in the prepared baking dish. Cover with foil and bake in the preheated oven for 25-30 minutes, or until the zucchini is tender.
**Step 7: Remove the foil, sprinkle shredded cheddar cheese over the stuffed zucchini, and return to the oven. Bake for an additional 5 minutes, or until the cheese is melted and bubbly.
**Step 8: Remove from the oven and garnish with chopped fresh cilantro before serving.
**Step 9: Enjoy these delicious stuffed zucchini as a nutritious and flavorful meal or appetizer!'),
(69,23, 'Zucchini lasagna', 'Zucchini lasagna is a lighter take on traditional lasagna, replacing pasta sheets with thinly sliced zucchini layers, creating a delicious and low-carb alternative that is still packed with flavor',
'     • 3 large zucchini, sliced lengthwise into thin strips
**     • 1 pound ground beef or turkey
**     • 1 onion, chopped
**     • 3 cloves garlic, minced
**     • 1 can (24 ounces) crushed tomatoes
**     • 1 can (6 ounces) tomato paste
**     • 1 teaspoon dried basil
**     • 1 teaspoon dried oregano
**     • Salt and pepper to taste
**     • 2 cups ricotta cheese
**     • 1/2 cup grated Parmesan cheese
**     • 2 cups shredded mozzarella cheese
**     • Fresh basil leaves, for garnish', 
'Step 1: Preheat your oven to 375°F (190°C). Grease a 9x13-inch baking dish with non-stick spray.
**Step 2: In a large skillet, cook the ground beef or turkey over medium heat until browned. Add the chopped onion and minced garlic, and cook until softened, about 5 minutes.
**Step 3: Stir in the crushed tomatoes, tomato paste, dried basil, dried oregano, salt, and pepper. Simmer for 10-15 minutes, stirring occasionally, to allow the flavors to meld together.
**Step 4: In a separate bowl, combine the ricotta cheese and grated Parmesan cheese.
**Step 5: Arrange a layer of sliced zucchini strips on the bottom of the prepared baking dish, overlapping slightly.
**Step 6: Spread half of the meat sauce over the zucchini layer.
**Step 7: Dollop half of the ricotta cheese mixture over the meat sauce layer, then sprinkle with half of the shredded mozzarella cheese.
**Step 8: Repeat the layers with the remaining zucchini, meat sauce, ricotta cheese mixture, and shredded mozzarella cheese.
**Step 9: Cover the baking dish with foil and bake in the preheated oven for 30 minutes.
**Step 10: Remove the foil and bake for an additional 15-20 minutes, or until the cheese is bubbly and golden brown.
**Step 11: Remove from the oven and let the zucchini lasagna cool for a few minutes before serving.
**Step 12: Garnish with fresh basil leaves before serving.
**Step 13: Enjoy this delicious and healthy zucchini lasagna as a satisfying meal for the whole family!');
/*!40000 ALTER TABLE `fooddetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fooduser`
--

DROP TABLE IF EXISTS `fooduser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fooduser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUser` int DEFAULT NULL,
  `idFood` int DEFAULT NULL,
  `favourite` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idFood` (`idFood`),
  CONSTRAINT `fooduser_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
  CONSTRAINT `fooduser_ibfk_2` FOREIGN KEY (`idFood`) REFERENCES `fooddetail` (`idFood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooduser`
--

LOCK TABLES `fooduser` WRITE;
/*!40000 ALTER TABLE `fooduser` DISABLE KEYS */;
/*!40000 ALTER TABLE `fooduser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientdetail`
--

DROP TABLE IF EXISTS `ingredientdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientdetail` (
  `idIngredient` int NOT NULL AUTO_INCREMENT,
  `nameIngredient` text,
  `descIngredient` text,
  PRIMARY KEY (`idIngredient`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientdetail`
--

LOCK TABLES `ingredientdetail` WRITE;
/*!40000 ALTER TABLE `ingredientdetail` DISABLE KEYS */;
INSERT INTO `ingredientdetail` VALUES (1,'Apple','Crisp and sweet apples, bringing a refreshing taste to any dish.'),(2,'Beans','Nutrient-rich beans, an excellent choice for health.'),(3,'Beetroot','Fresh red beetroots, known for their rich flavor and vibrant color.'),(4,'Bell Pepper','Colorful bell peppers, adding crunch and sweetness to every dish.'),(5,'Cabbage','Smooth green cabbage, an essential ingredient in salads.'),(6,'Carrot','Crunchy carrots with natural sweetness, great for vision health.'),(7,'Cucumber','Cool cucumbers, ideal for cooling off in the summer.'),(8,'Egg','Nutritious eggs, versatile in many cooking recipes.'),(9,'Eggplant','Soft eggplants, great when cooked in stir-fries.'),(10,'Garlic','Strong-smelling garlic, a staple seasoning in every kitchen.'),(11,'Grape','Sweet grapes, perfect for desserts or as a light snack.'),(12,'Lemon','Fresh lemons, adding a tangy freshness to every dish.'),(13,'Mango','Juicy ripe mangoes, sweet and tropical.'),(14,'Napa Cabbage','Crunchy Napa cabbage, perfect for Asian-style salads.'),(15,'Onion','Pungent onions, the base for many dishes.'),(16,'Orange','Fresh oranges, sweet and full of vitamin C.'),(17,'Peach','Soft and fragrant peaches, bringing summer flavor in every bite.'),(18,'Potato','Versatile potatoes for dishes from frying to baking.'),(19,'Radish','Crunchy red radishes, adding a mild spicy flavor to salads and dishes.'),(20,'Sapota','Sweet sapotas with a distinctive caramel flavor.'),(21,'Tomato','Juicy tomatoes, an essential ingredient in every sauce.'),(22,'Turnip','Crisp white turnips, perfect for stew or stir-fry.'),(23,'Zucchini','Soft zucchinis, a great choice for quick stir-fries or stuffing.');
/*!40000 ALTER TABLE `ingredientdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `userName` text,
  `email` text,
  `pass` text,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_mobile'
--

--
-- Dumping routines for database 'db_mobile'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-27 23:30:24
