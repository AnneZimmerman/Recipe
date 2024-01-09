using CPUFramework;
using System.Data;

namespace RecipeWinForms
{
    public partial class frmRecipe : Form
    {
        public frmRecipe()
        {
            InitializeComponent();
        }

        public void ShowForm(int recipeid)
        {
            string sql = "select r.*, i.Ingredient from Recipe r join RecipeIngredient ri on r.RecipeId = ri.RecipeId join Ingredient i on i.IngredientId = ri.IngredientId where r.RecipeId = " + recipeid.ToString();
            DataTable dt = SQLUtility.GetDataTable(sql);
            lblRecipeName.DataBindings.Add("Text", dt, "RecipeName");
            txtDraftDate.DataBindings.Add("Text", dt, "DraftDate");
            txtDatePublished.DataBindings.Add("Text", dt, "PublishedDate");
            txtDateArchived.DataBindings.Add("Text", dt, "ArchivedDate");
            txtCalories.DataBindings.Add("Text", dt, "Calories");
            txtRecipeStatus.DataBindings.Add("Text", dt, "RecipeStatus");
            txtIngredients.DataBindings.Add("Text", dt, "Ingredint");
            this.Show();
        }
    }
}
