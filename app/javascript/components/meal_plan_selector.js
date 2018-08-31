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

  const mealPlanForm = document.querySelector("#meal-plan-form");
  const mealPlanFromButton = document.querySelector("#meal-plan-form button");

  mealPlanFromButton.addEventListener("click", () => mealPlanForm.submit());
}

function addToForm(meal) {
  const insertion =
  "<div class='selection meal-selection-" + meal.dataset.mealId + "'>" +
    "<div class='img-sidebar' style=\"background-image: url('" + meal.children[0].dataset.picUrl + "');\"></div>"+
    "<div class='meal-selection-content'><div class='meal-selection-name'>" + meal.dataset.mealName +"</div>" +
    "<div class='meal-selection-calories'><i class='fas fa-fire'></i>" + meal.dataset.mealCalories + "</div></div>" +
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
      if (event.target.classList.contains("meal-details")) { return false; }
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
