<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css link -->
<link href="/static/css/select.css" rel="stylesheet"/>

<!-- js -->
<script type="text/javascript" src ="/static/js/select.js"></script>

</head>
<body>
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
<script src="http://code.jquery.com/jquery-latest.js"></script> 
</body>
</html>