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
            string sql = "select r.* from Recipe r where r.RecipeId = " + recipeid.ToString();
            DataTable dt = SQLUtility.GetDataTable(sql);
            lblRecipeName.DataBindings.Add("Text", dt, "RecipeName");
            lblDraftDate.DataBindings.Add("Text", dt, "DraftDate");
            lblDatePublished.DataBindings.Add("Text", dt, "PublishedDate");
            lblDateArchived.DataBindings.Add("Text", dt, "ArchivedDate");
            lblCalories.DataBindings.Add("Text", dt, "Calories");
            lblRecipeStatus.DataBindings.Add("Text", dt, "RecipeStatus");
            this.Show();
        }
    }
}
