const meal_plan = document.querySelector(".meal-planner")

function addToForm(meal) {
  const insertion = "<div class='selection meal-selection-" + meal.dataset.mealId + "'><img width='1000px' height='750px' class='meal-selection-image' src='" + meal.children[0].src + "'></div>"
  
  meal_plan.innerHTML += insertion;
  sessionStorage.setItem(meal.dataset.mealId, "true");
  console.log(sessionStorage);
}

function removeFromForm(meal) {
  const mealToRemove = document.querySelector(".meal-selection-" + meal.dataset.mealId);
  mealToRemove.outerHTML = "";
  sessionStorage.removeItem(meal.dataset.mealId);
  console.log(sessionStorage);
}

function initMealPlanSelectorLogic() {
  const meals = [];
  const mealsFromTab = document.querySelectorAll(".nutritionist-meal-card");

  mealsFromTab.forEach(function(element) {
    element.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("selected");
      const mealId = event.currentTarget.dataset.mealId;
      let mealElement = document.querySelector(".meal-selection-" + mealId)
      //if (event.currentTarget.classList.contains('selected')) {
      if (mealElement == null) {
        addToForm(event.currentTarget);
      } else {
        removeFromForm(event.currentTarget)
      }
     });
  });
}

let selections = [];
let currentSelectionsIds = [];

export { initMealPlanSelectorLogic };
