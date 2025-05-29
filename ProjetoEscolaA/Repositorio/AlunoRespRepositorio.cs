namespace ProjetoEscolaA.Repositorio
{
    public class AlunoRespRepositorio
    {
        //Declarando a string de conexão como leitura
        private readonly string _connectionString;

        //Construtor que recebe a string de conexão
        public AlunoRespRepositorio(string connectionString) 
        {
            _connectionString = connectionString;
        }

    }
}
