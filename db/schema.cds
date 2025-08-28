using {cuid} from '@sap/cds/common';

namespace cookbook;

entity Courses : cuid {
    name : String(100) not null;
}

entity Ingredients : cuid {
    name              : String(150) not null;
    description       : String(300);
    recipeIngredients : Composition of many RecipeIngredientLink
                            on recipeIngredients.ingredient = $self;
}


entity Recipes : cuid {
    name              : String(200) @mandatory;
    instructions      : LargeString not null;
    preperationTime   : Integer;
    servings          : Integer;

    course            : Association to one Courses not null;
    recipeIngredients : Composition of many RecipeIngredientLink
                            on recipeIngredients.recipe = $self;
}


entity RecipeIngredientLink : cuid {
    quantity   : Decimal(10, 2) not null;
    unit       : String(50);
    notes      : String(255);

    ingredient : Association to one Ingredients not null @assert.target;
    recipe     : Association to one Recipes;
}


entity RecipeDetails as
    select from Recipes {
        ID,
        course,
        course.name as courseName,
    }

annotate Recipes with @odata.draft.enabled;


// view RecipeDetails with parameters test : uuid as select from recipes {
//     id, course, course.name as coursename
// }

// entity RecipeDetails as
//     select from cookbook.Recipes as Recipes
//     inner join cookbook.Courses as Courses
//         on Recipes.course.ID = Courses.ID
//     {
//         instructions,
//         Recipes.name as recipe,
//         Courses.name as course,
//     }
//     order by
//         recipe asc;
