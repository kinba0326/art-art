$(function() {


  var search_list = $(".contents.row");

  function appendArt(art) {
    if(art.user_sign_in && art.user_sign_in.id == art.user_id){
      var current_user = `<li>
                            <a href="/arts/${art.id}/edit" data-method="get" >編集</a>
                          </li>
                          <li>
                            <a href="/arts/${art.id}" data-method="delete" >削除</a>
                          </li>`
    } else {
      var current_user = ""
    }

    var html = `<div class="content_post" style="background-image: url(${art.image});">
                  <div class="more">
                    <span><img src="/assets/arrow_top.png"></span>
                    <ul class="more_list">
                      <li>
                        <a href="/arts/${art.id}" data-method="get" >詳細</a>
                      </li>
                      ${current_user}
                    </ul>
                  </div>
                  <p>${art.text}</p><br>
                  <span class="name">
                    <a href="/users/${art.user_id}">
                      <span>投稿者</span>${art.nickname}
                    </a>
                  </span>
                </div>`
    search_list.append(html);
  }
  
  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/arts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(arts) {
      search_list.empty();
      if (arts.length !== 0) {
        arts.forEach(function(art){
          appendArt(art);
        });
      }
      else {
        appendErrMsgToHTML("一致する作品がありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});