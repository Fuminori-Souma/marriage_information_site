// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"
// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()

// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")

$(function(){
  setTimeout("$('.flash').fadeOut('slow')", 2000);
});

// turbolinksの無効化
$(document).on('turbo:load', function() {
  $(function() {
    // .tabがクリックされたときを指定
    $('.tab').click(function(){
      // console.log('イったぜ');
      // 今ある.tab-activeを削除
      $('.tab-active').removeClass('tab-active');
      // クリックされた.tabに.tab-activeを追加
      $(this).addClass('tab-active');
      // 今ある.box-showを削除
      $('.box-show').removeClass('box-show');
      // indexに.tabのindex番号を代入
      const index = $(this).index();
      // .tabboxとindexの番号が同じ要素に.box-showを追加
      $('.tabbox').eq(index).addClass('box-show');      
    });
  });
});

// $(document).on('turbo:load', function() {
//   $(function() {
//     // .tabがクリックされたときを指定
//     $('.postime').click(function(){
      
//       var a = document.getElementById('postime');
      
//       alert(this);
//       // alert(a.textContent);
//     });
//   });
// });

$(function() {
  $('.postime').click(function(){
    var a = document.getElementById('testtest');
    alert(a.textContent + 'っス…');
  });
});import * as bootstrap from "bootstrap"
