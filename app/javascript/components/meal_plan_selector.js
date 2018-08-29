const meal_plan = document.querySelector(".meal-planner")
const mealSelectionsInForm = document.querySelector(".meal-selections")

if (meal_plan) {
  meal_plan.addEventListener("submit", (event) => {
    const mealSelections = document.querySelectorAll(".meal-planner .selection");
    const mealTypes = ["breakfast", "lunch", "dinner"];

    mealSelections.forEach((mealSelection, index) => {
      mealSelection.lastElementChild.setAttribute("name", mealTypes[index]);
    });
  });
}

function addToForm(meal) {
  const insertion =
  "<div class='selection meal-selection-" + meal.dataset.mealId + "'>" +
    "<img width='1000px' height='750px' class='meal-selection-image' src='" + meal.children[0].src + "'>" +
    `<input type='hidden' value='${meal.dataset.mealId}'>` +
  "</div>";

  mealSelectionsInForm.innerHTML += insertion;
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

export { initMealPlanSelectorLogic };
