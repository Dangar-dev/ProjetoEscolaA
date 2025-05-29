using Microsoft.AspNetCore.Mvc;
using ProjetoEscolaA.Repositorio;

namespace ProjetoEscolaA.Controllers
{

    public class EscolaController : Controller
    {
        //DECLARANDO A VARIAVEL QUE O CONSTRUTOR VAI RECEBER
        public readonly AlunoRespRepositorio _alunorespRepositorio;

        //Construtor
        public EscolaController(AlunoRespRepositorio alunoRespRepositorio)
        {
            _alunorespRepositorio = alunoRespRepositorio;
        }

        public IActionResult ResponsaveisAlunos()
        {
            var data = _alunorespRepositorio.ResponsavelComAluno();
            return View();
        }
    }
}
