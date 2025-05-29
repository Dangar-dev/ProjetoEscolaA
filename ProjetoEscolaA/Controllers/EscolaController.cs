using Microsoft.AspNetCore.Mvc;

namespace ProjetoEscolaA.Controllers
{
    public class EscolaController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
