namespace ProjetoEscolaA.Models
{
    public class Responsavel
    {
        public int CodResp {  get; set; }

        public int CodAluno { get; set; }

        public string NomeResp { get; set; }

        public Aluno Aluno { get; set; }
    }
}
