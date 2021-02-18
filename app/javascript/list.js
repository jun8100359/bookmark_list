function list() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/lists", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const item = XHR.response.list;
      const lists = document.getElementById("list");
      const formText = document.getElementById("list_name");
      const HTML = `
        <div class="list" data-id=${item.id}>
          ${item.list_name}
        </div>`;
      lists.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
  const imageTag = document.querySelectorAll('.image-tag');
  imageTag.forEach(function(tag) {
    const next = tag.nextElementSibling;
    tag.addEventListener('click', () => {
      next.setAttribute('style', 'display: block;');
    });
    document.addEventListener('click', (e) => {
      if(!e.target.closest('.list')) {
        if(next.getAttribute('style') == 'display: block;') {
          next.removeAttribute('style', 'display: block;')
        };
      };
    });
  });
};
window.addEventListener('load', list);