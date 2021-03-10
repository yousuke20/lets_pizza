// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree
/*global $*/

// flashメッセージのフェードアウト設定
  $(function(){
    setTimeout("$('.alert').fadeOut('slow')", 2500);
  });

// 顧客トップ画面 スライドショーの設定
  $(document).ready(function(){
    $('#theTarget').skippr({
      transition: 'slide',
      speed: 1000,
      easing: 'easeOutQuart',
      navType: 'bubble',
      childrenElementType: 'div',
      arrows: true,
      autoPlay: true,
      autoPlayDuration: 3000,
      keyboardOnAlways: true,
      hidePrevious: false
    });
    
  // スクロールによるフェードインの設定
    $(window).scroll(function(){
      const wHeight = $(window).height();
      const scrollAmount = $(window).scrollTop();
      $('.scrollanime').each(function(){
        const targetPosition = $(this).offset().top;
        if (scrollAmount > targetPosition - wHeight + 50) {
          $(this).addClass("fadeInDown");
        }
      });
    });
    
    // タブメニューの設定
    $('#tab-contents .tab[id != "tab1"]').hide();
    
    $('#tab-menu a').on('click',function(event){
      $('#tab-contents .tab').hide();
      $('#tab-menu .active').removeClass("active");
      $(this).addClass("active");
      $($(this).attr("href")).show();
      event.preventDefault();
    });
    
    // 画面トップへ戻るボタンの設定
    $(function(){
      $('#scroll-back a').on('click',function(event){
        $('body,html').animate({
          scrollTop: 0
        }, 700);
        event.preventDefault();
      });
    });
    
  });