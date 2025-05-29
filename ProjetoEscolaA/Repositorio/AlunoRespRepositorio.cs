using MySql.Data.MySqlClient;
using ProjetoEscolaA.Models;
using System.Reflection.Metadata.Ecma335;

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
        public List<RespAluno> ResponsaveisComAluno()
        {
            var lista = new List<RespAluno>();

            using(MySqlConnection conexao= new MySqlConnection(_connectionString))
            {
                conexao.Open();
                string query = @"select r.CodResp , r.NomeResp as Nome_Responsavel,a.NomeAluno as Nome_Aluno
                                from Responsavel r inner join Aluno a on r.CodAluno = a.CodAluno;";
                using(MySqlCommand comando = new MySqlCommand(query, conexao))
                {
                    using (MySqlDataReader reader = comando.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new RespAluno
                            {
                                CodResp = reader.GetInt32("CodResp"),
                                NomeResponsavel = reader.GetString("Nome_Responsavel"),
                                NomeAluno = reader.GetString("Nome_Aluno")
                            });
                        }
                    }
                }return lista;
            }
        }

        
    }
}
