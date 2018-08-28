const meal_plan = document.querySelector(".meal-planner")

function addToForm(meal) {
  const insertion = "<input type='hidden' class='meal-" + meal.dataset.mealId + "' value='" + meal.dataset.mealId + "'>";
  meal_plan.innerHTML += insertion;
}

function removeFromForm(meal) {
  const mealToRemove = document.querySelector(".meal-" + meal.dataset.mealId);
  mealToRemove.outerHTML = ""
}

function initMealPlanSelectorLogic() {
  // logic in here
  const meals = [];
  const mealsFromTab = document.querySelectorAll(".nutritionist-meal-card");

  mealsFromTab.forEach(function(element) {
    element.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("selected");
      if (event.currentTarget.classList.contains('selected')) {
        addToForm(event.currentTarget);
      } else {
        removeFromForm(event.currentTarget)
      }
     });
  });
}

export { initMealPlanSelectorLogic };
