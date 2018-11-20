const copyToClipboard = str => {
  const el = document.createElement('textarea');
  el.value = str;
  document.body.appendChild(el);
  el.select();
  document.execCommand('copy');
  document.body.removeChild(el);
};

$(function() {
  $('.clipboard-link').click(function() {
    var url = $('.short-url-container').text()
    copyToClipboard(url)
    alert('Successfully copied to clipboad.')
  })
})
