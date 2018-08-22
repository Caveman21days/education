document.addEventListener('DOMContentLoaded', () => {
    const objectTypeSelect = document.querySelector('#object-type-select');

    const options = Array.from(objectTypeSelect.options).map(option => option.innerHTML);

    const handleClick = () => {
        const selectedObjectType = objectTypeSelect.value;
        const urlWithoutParams = window.location.href.split('?')[0];

        // just forward update the page with the url params lol
        window.location.href = `${urlWithoutParams}?object_type=${selectedObjectType}`;
    }


    objectTypeSelect.addEventListener('click', handleClick);
})