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
            string sql = "select r.*, i.Ingredient, ri.Quantity from Recipe r join RecipeIngredient ri on r.RecipeId = ri.RecipeId join Ingredient i on i.IngredientId = ri.IngredientId where r.RecipeId = " + recipeid.ToString();
            DataTable dt = SQLUtility.GetDataTable(sql);
            lblRecipeName.DataBindings.Add("Text", dt, "RecipeName");
            lblDraftDate.DataBindings.Add("Text", dt, "DraftDate");
            lblDatePublished.DataBindings.Add("Text", dt, "PublishedDate");
            lblDateArchived.DataBindings.Add("Text", dt, "ArchivedDate");
            lblCalories.DataBindings.Add("Text", dt, "Calories");
            lblRecipeStatus.DataBindings.Add("Text", dt, "RecipeStatus");
            lblIngredients.DataBindings.Add("Text", dt, "Ingredient");
            this.Show();
        }
    }
}
