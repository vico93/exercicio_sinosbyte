-- Limpa a tela do terminal
os.execute("cls");

-- Inicializa a tabela de alunos
alunos = {};

function insere_banco_dados(codAluno, nomeAluno, nota1, nota2, media, aprovado)
	local bd = io.open("dados.csv", "a");
	io.output(bd);
	io.write("\n", codAluno, ", ", nomeAluno, ", ", nota1, ", ", nota2, ", ", media, ", ", aprovado);
	io.close(bd);
end

-- Lê os dados de cada aluno
for i = 1,5, 1
do
	alunos[i] = {}
	
	print("ALUNO ", i);
	
	print("Digite o código do aluno: ");
	alunos[i]["codAluno"] = io.read();
	print("Digite o nome do aluno: ");
	alunos[i]["nomeAluno"] = io.read();
	print("Digite a primeira nota de ", alunos[i]["nomeAluno"], ": ");
	alunos[i]["nota1"] = io.read();
	print("Digite a segunda nota de ", alunos[i]["nomeAluno"], ": ");
	alunos[i]["nota2"] = io.read();

	-- A média é calculada somando-se a primeira nota mais duas vezes a segunda nota, e dividindo o resultado desta soma por três
	alunos[i]["media"] = (alunos[i]["nota1"] + (alunos[i]["nota2"] * 2)) / 3;
	print("A média das notas de ", alunos[i]["nomeAluno"], " é ", alunos[i]["media"]);

	-- O aluno está aprovado se a média for maior ou igual seis
	if (alunos[i]["media"] >= 6.0)
	then
		print(alunos[i]["nomeAluno"], "foi APROVADO!");
		alunos[i]["aprovado"] = "SIM";
	else
		print(alunos[i]["nomeAluno"], "foi REPROVADO!");
		alunos[i]["aprovado"] = "NÃO";
	end

	-- Salvar no "banco de dados" (arquivo CSV)
	insere_banco_dados(alunos[i]["codAluno"], alunos[i]["nomeAluno"], alunos[i]["nota1"], alunos[i]["nota2"], alunos[i]["media"], alunos[i]["aprovado"]);

	-- Apenas pra confirmar e limpar a tela
	print("Pressione ENTER para continuar");
	io.read();
	os.execute("cls");
end