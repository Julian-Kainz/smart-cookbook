using cookbook from '../db/schema';

service CookbookService @(path: '/cookbook') {

    function sum(x: Integer, y: Integer)                                  returns Integer;
    action   addCourse(courseID: UUID, courseName: cookbook.Courses:name) returns String;

    entity Course  as projection on cookbook.Courses;


    // entity RecipeIngredientLink as projection on cookbook.RecipeIngredientLink;

    // @readonly
    entity Recipes as projection on cookbook.Recipes;
// entity Ingredients as projection on cookbook.Ingredients;

// entity resturation as projection on cookbook.resturation;
}

service DetailService @(path: '/details') {
    entity RecipeDetails as projection on cookbook.RecipeDetails
}
