import "bootstrap";
import "../components/carousel.js";
import { initMealPlanSelectorLogic } from "../components/meal_plan_selector.js";

initMealPlanSelectorLogic();
sessionStorage.clear();
window.initMealPlanSelectorLogic = initMealPlanSelectorLogic;
