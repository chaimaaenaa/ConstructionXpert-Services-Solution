document.addEventListener('DOMContentLoaded', () => {
    const deleteButtons = document.querySelectorAll('.delete-button');
    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const taskCard = button.closest('.task-card');
            taskCard.remove();
        });
    });
});

