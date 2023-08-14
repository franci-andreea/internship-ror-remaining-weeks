document.addEventListener("DOMContentLoaded", (event) => {

  var category = document.getElementById("category");
  var sorting = document.getElementById("sorting");
  var vegetarian_select = document.getElementById("vegetarian_select");

  //CATEGORY
  var categoryEntree = document.getElementById("entree");
  categoryEntree.addEventListener(
    'click',
    (event) => {
      category.value = categoryEntree.getAttribute("value");
    }
  );

  var categorySecondCourse = document.getElementById("second-course");
  categorySecondCourse.addEventListener(
    'click',
    (event) => {
      category.value = categorySecondCourse.getAttribute("value");
    }
  );

  var categoryDessert = document.getElementById("dessert");
  categoryDessert.addEventListener(
    'click',
    (event) => {
      category.value = categoryDessert.getAttribute("value");
    }
  );

  // SORTING
  var az_sorting = document.getElementById("az");
  az_sorting.addEventListener(
    'click',
    (event) => {
      sorting.value = az_sorting.getAttribute("value");
    }
  );

  var za_sorting = document.getElementById("za");
  za_sorting.addEventListener(
    'click',
    (event) => {
      sorting.value = za_sorting.getAttribute("value");
    }
  );

  var ascending_price = document.getElementById("ascending-price");
  ascending_price.addEventListener(
    'click',
    (event) => {
      sorting.value = ascending_price.getAttribute("value");
    }
  );

  var descending_price = document.getElementById("descending-price");
  descending_price.addEventListener(
    'click',
    (event) => {
      sorting.value = descending_price.getAttribute("value");
    }
  );

  // VEGETARIAN
  var vegetarian = document.getElementById("vegetarian");
  vegetarian.addEventListener(
    'click',
    (event) => {
      vegetarian_select.value = vegetarian.getAttribute("value");
      console.log(vegetarian.value)
    }
  );

  var non_vegetarian = document.getElementById("non-vegetarian");
  non_vegetarian.addEventListener(
    'click',
    (event) => {
      vegetarian_select.value = non_vegetarian.getAttribute("value");
      console.log(vegetarian.value)
    }
  );
});
