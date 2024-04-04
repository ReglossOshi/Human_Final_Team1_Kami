window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('recipe_Table');
    if (recipe_Table) {
        new simpleDatatables.DataTable(recipe_Table);
    }
});
