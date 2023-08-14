document.addEventListener("DOMContentLoaded", function () {
  let uislider = document.getElementById("uislider");
  let min = document.getElementById("min-slider");
  let max = document.getElementById("max-slider");

  let min_price = document.getElementById("min_price");
  let max_price = document.getElementById("max_price");

  noUiSlider.create(uislider, {
    start: [5, 85],
    step: 0.1,
    margin: 0,
    connect: true,
    orientation: 'horizontal', // Orient the slider vertically
    behaviour: 'tap-drag', // Move handle on tap, bar is draggable
    range: {
      min: 1,
      max: 100
    },
  });

  uislider.noUiSlider.on('update', function (values, handle) {
    min.textContent = "$" + values[0];
    max.textContent = "$" + values[1];

    min_price.value = values[0];
    max_price.value = values[1];
  });
});
