(function($) {
$.fn.fixedHeaderAdjuster = function(options){
  'use strict';
  options = $.extend({
    property: 'padding-top',  // 固定ヘッダーと同じ値にするプロパティ名
    target: 'body', // プロパティを調整する要素
    adjust: 0,      // プロパティの値を adjust 分加算
  }, options);
  var $this = $(this),
      $target = $(options.target),
      initial = $this.css(options.property);
   
  update();
  $(window).on('resize load', update);
   
  function update(){
    var v;
    if($this.css('position') === 'fixed'){
      v = $this.outerHeight() + options.adjust + 'px';
    }else{
      v = initial;
    }
    $target.css(options.property, v);
  }
}
})(jQuery);

