// This URL will need to be updated after deployment
const API_URL = 'YOUR_CLOUD_FUNCTION_URL_HERE';

document.addEventListener('DOMContentLoaded', () => {
    const counterElement = document.getElementById('counter');

    // For now, just a placeholder or mock fetch
    // In production, uncomment the fetch
    /*
    fetch(API_URL)
        .then(response => response.json())
        .then(data => {
            counterElement.innerText = data.count;
        })
        .catch(error => {
            console.error('Error fetching count:', error);
            counterElement.innerText = 'Error';
        });
    */
    counterElement.innerText = '(Loading...)';
});
