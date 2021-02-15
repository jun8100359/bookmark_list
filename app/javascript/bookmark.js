function bookmark(){
  const clickBookmark = document.getElementById("click");
  const formBookmark = document.getElementById("bmf");
  const url = location.href;

  clickBookmark.addEventListener('click', function(e){
    formBookmark.setAttribute('style', 'display: block;')
    document.addEventListener('click', (e) => {
      if(!e.target.closest('.click-new') && !e.target.closest('.new-bookmark')) {
        formBookmark.removeAttribute('style', 'display: block')
      };
    });
  });

  const submit = document.getElementById("bm_submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById('bm_form'));

    const XHR = new XMLHttpRequest();
    XHR.open('POST', url, true);
    XHR.responseType = 'json';
    XHR.send(formData);
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
            ${item.bookmark_url}
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