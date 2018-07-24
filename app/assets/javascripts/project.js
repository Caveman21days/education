document.addEventListener('DOMContentLoaded', () => {
  const lastIssueDates = document.querySelectorAll('.last-issue-date');
  lastIssueDates.forEach(el => {
    const uglyDate = el.textContent;
    const fancyDate = new Date(uglyDate);
    el.textContent = fancyDate.toDateString();
  })
})
