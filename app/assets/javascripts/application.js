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
/*global google $*/

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
    
  // Google Map APIの設定
    $(function initMap(){
      
    // map1 ピッツェリア GG 吉祥寺の緯度経度
      var map1 = new google.maps.Map(document.getElementById('map1'),{
      // 中心点緯度経度(吉祥寺駅)
      center: new google.maps.LatLng(35.7021253, 139.5773068),
      // ズームレベル
      zoom: 15,
      // 距離メモリの表示
      scaleControl: true,
      // 地図の種類
      mapTypeId: google.maps.MapTypeId.ROADMAP
      });
      
      var marker = new google.maps.Marker({
        // マーカーを置く緯度経度(お店の場所)
        position: new google.maps.LatLng(35.7008301, 139.578633),
        map: map1
      });
  
  
    // map2 FREY's Famous Pizzeriaの緯度経度
      var map2 = new google.maps.Map(document.getElementById('map2'),{
      // 中心点緯度経度(六本木駅)
      center: new google.maps.LatLng(35.6627251, 139.7312165),
      // ズームレベル
      zoom: 15,
      // 距離メモリの表示
      scaleControl: true,
      // 地図の種類
      mapTypeId: google.maps.MapTypeId.ROADMAP
      });
      
      var marker = new google.maps.Marker({
        // マーカーを置く緯度経度(お店の場所)
        position: new google.maps.LatLng(35.6652052, 139.7326674),
        map: map2
      });
      
      
    // map3 ピッツェリア ダ・アオキの緯度経度
      var map3 = new google.maps.Map(document.getElementById('map3'),{
      // 中心点緯度経度(豊島園駅)
      center: new google.maps.LatLng(35.7420538,139.6491104),
      // ズームレベル
      zoom: 14,
      // 距離メモリの表示
      scaleControl: true,
      // 地図の種類
      mapTypeId: google.maps.MapTypeId.ROADMAP
      });
      
      var marker = new google.maps.Marker({
        // マーカーを置く緯度経度(お店の場所)
        position: new google.maps.LatLng(35.7478447,139.6494077),
        map: map3
      });
      
    });
    
  });