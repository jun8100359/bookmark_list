function bookmark(){
  const clickBookmark = document.getElementById("click");
  const formBookmark = document.getElementById("bmf");

  clickBookmark.addEventListener('click', function(){
    formBookmark.setAttribute('style', 'display: block;');
    document.addEventListener('click', (e) => {
      if(!e.target.closest('.click-new') && !e.target.closest('.new-bookmark')) {
        formBookmark.removeAttribute('style', 'display: block');
      };
    });
  });
  const openBookmarks = document.querySelectorAll(".bookmark");
  openBookmarks.forEach(function(bookmark) {
    const lastElementChild = bookmark.lastElementChild;
    bookmark.addEventListener('click', () => {
      lastElementChild.setAttribute('style', 'display: block;');
    });
    document.addEventListener('click', (e) => {
      if(!e.target.closest('.bookmark')) {
          if ((lastElementChild.getAttribute('style') == 'display: block;') === !null) {
            lastElementChild.removeAttribute('style', 'display: block;')
          };
      };
    });
  });


};
window.addEventListener('load', bookmark);