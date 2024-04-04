
<style>
    /* ===== Resets and Housekeeping ===== */
    * {
      padding: 0;
      margin: 0;
    }

    html {
      font-size: 16px;
    }

    body {
      background: #eeebe7;
      padding: 100px 20px;
      text-align: center;
    }

    /* ===== Actual Styles ===== */

    /* ===== Horizontal Rule ===== */
    .rule {
      margin: 10px 0;
      border: none;
      height: 1.5px;
      background-image: linear-gradient(left, #f0f0f0, #c9bbae, #f0f0f0);
    }

    /* ===== Select Box ===== */
    .sel {
      font-size: 1rem;
      display: inline-block;
      margin: 3em 2em;
      width: 350px;
      background-color: transparent;
      position: relative;
      cursor: pointer;
    }

    .sel::before {
      position: absolute;
      content: '\f063';
      font-family: 'FontAwesome';
      font-size: 2em;
      color: #FFF;
      right: 20px;
      top: calc(50% - 0.5em);
    }

    .sel.active::before {
      transform: rotateX(-180deg);
    }

    .sel__placeholder {
      display: block;
      font-family: 'Quicksand';
      font-size: 2.3em;
      color: #838e95;
      padding: 0.2em 0.5em;
      text-align: left;
      pointer-events: none;
      user-select: none;
      visibility: visible;
    }

    .sel.active .sel__placeholder {
      visibility: hidden;
    }

    .sel__placeholder::before {
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      padding: 0.2em 0.5em;
      content: attr(data-placeholder);
      visibility: hidden;
    }

    .sel.active .sel__placeholder::before {
      visibility: visible;
    }

    .sel__box {
      position: absolute;
      top: calc(100% + 4px);
      left: -4px;
      display: none;
      list-style-type: none;
      text-align: left;
      font-size: 1em;
      background-color: #FFF;
      width: calc(100% + 8px);
      box-sizing: border-box;
    }

    .sel.active .sel__box {
      display: block;
      animation: fadeInUp 500ms;
    }

    .sel__box__options {
      display: list-item;
      font-family: 'Quicksand';
      font-size: 1.5em;
      color: #838e95;
      padding: 0.5em 1em;
      user-select: none;
    }

    .sel__box__options::after {
      content: '\f00c';
      font-family: 'FontAwesome';
      font-size: 0.5em;
      margin-left: 5px;
      display: none;
    }

    .sel__box__options.selected::after {
      display: inline;
    }

    .sel__box__options:hover {
      background-color: #ebedef;
    }

    /* ----- Select Box Black Panther ----- */
    .sel {
      border-bottom: 4px solid rgba(0, 0, 0, 0.3);
    }

    .sel--black-panther {
      z-index: 3;
    }

    /* ----- Select Box Superman ----- */
    .sel--superman {
    /*   display: none; */
      z-index: 2;
    }

    /* ===== Keyframes ===== */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translate3d(0, 20px, 0);
      }

      to {
        opacity: 1;
        transform: none;
      }
    }

    @keyframes fadeOut {
      from {
        opacity: 1;
      }

      to {
        opacity: 0;
      }
    }
</style>


<div class="sel sel--black-panther">
  <select name="select-profession" id="select-profession">
    <option value="" disabled>Profession</option>
    <option value="hacker">Hacker</option>
    <option value="gamer">Gamer</option>
    <option value="developer">Developer</option>
    <option value="programmer">Programmer</option>
    <option value="designer">Designer</option>
  </select>
</div>

<hr class="rule">

<div class="sel sel--superman">
  <select name="select-superpower" id="select-superpower">
    <option value="" disabled>Superpower</option>
    <option value="hacker">Power</option>
    <option value="gamer">Speed</option>
    <option value="developer">Acrobatics</option>
    <option value="programmer">Accuracy</option>
  </select>
</div>

<!--
  <span class="sel__placeholder sel__placeholder--black-panther">Placeholder Text</span>
  <div class="sel__box sel__box--black-panther">
    <span data-option="option_1" class="sel__box__options sel__box__options--black-panther">Option 1</span>
    <span data-option="option_2" class="sel__box__options sel__box__options--black-panther">Option 2</span>
    <span data-option="option_3" class="sel__box__options sel__box__options--black-panther">Option 3</span>
    <span data-option="option_4" class="sel__box__options sel__box__options--black-panther">Option 4</span>
    <span data-option="option_5" class="sel__box__options sel__box__options--black-panther">Option 5</span>
  </div>
-->

<!--
  .not-active.selected = hide
  .active.selected = show
-->

<script>
/* ===== Logic for creating fake Select Boxes ===== */
$('.sel').each(function() {
  $(this).children('select').css('display', 'none');

  var $current = $(this);

  $(this).find('option').each(function(i) {
    if (i == 0) {
      $current.prepend($('<div>', {
        class: $current.attr('class').replace(/sel/g, 'sel__box')
      }));

      var placeholder = $(this).text();
      $current.prepend($('<span>', {
        class: $current.attr('class').replace(/sel/g, 'sel__placeholder'),
        text: placeholder,
        'data-placeholder': placeholder
      }));

      return;
    }

    $current.children('div').append($('<span>', {
      class: $current.attr('class').replace(/sel/g, 'sel__box__options'),
      text: $(this).text()
    }));
  });
});

// Toggling the `.active` state on the `.sel`.
$('.sel').click(function() {
  $(this).toggleClass('active');
});

// Toggling the `.selected` state on the options.
$('.sel__box__options').click(function() {
  var txt = $(this).text();
  var index = $(this).index();

  $(this).siblings('.sel__box__options').removeClass('selected');
  $(this).addClass('selected');

  var $currentSel = $(this).closest('.sel');
  $currentSel.children('.sel__placeholder').text(txt);
  $currentSel.children('select').prop('selectedIndex', index + 1);
});

</script>
