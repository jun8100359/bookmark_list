function bookmark(){
  const clickBookmark = document.getElementById("click");
  const formBookmark = document.getElementById("bmf");
  const cancelBookmark = document.getElementById("cancel");

  clickBookmark.addEventListener('click', function(){
    formBookmark.setAttribute("style", "display: block;");
    cancelBookmark.setAttribute("style", "display: block;");
  });

  cancelBookmark.addEventListener('mouseup', function(){
    formBookmark.removeAttribute("style", "display: block;");
    cancelBookmark.removeAttribute("style", "display: block;");
  });

  const submit = document.getElementById("bm_submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById('bm_form'));
    const XHR = new XMLHttpRequest();
    XHR.open('POST', '/lists/@list_id.list_id', true);
    XHR.responseType = 'json';
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const item = XHR.response.bookmark;
      const bookmarks = document.getElementById('bookmark');
      const formText1 = document.getElementById('title');
      const formText2 = document.getElementById('url');
      const formText3 = document.getElementById('text');
      const HTML = `
        <div class="bookmark" data-id=${item.id}>
          <div class="bookmark-title">
            ${item.title}
          </div>
          <div class="bookmark-url>
            ${item.url}
          </div>
          <div class="bookmark-text>
            ${item.text}
          </div>
        </div>`;
      bookmarks.insertAdjacentHTML('afterend', HTML);
      formText1.value = "";
      formText2.value = "";
      formText3.value = "";
    };
    e.preventDefault();
  });
};
window.addEventListener('load', bookmark);