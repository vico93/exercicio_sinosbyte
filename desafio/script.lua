-- Leitura da lista
lista_vacinacao = {};
i = 0;
for line in io.lines("covid-vaccination-brazil.csv")
do
    local dt_registro, total_vaccinations = line:match("%s*(.+);%s*(.+)");
	i = i+1;
	lista_vacinacao[i] = {};
	lista_vacinacao[i]["dt_registro"] = dt_registro;
	lista_vacinacao[i]["total_vaccinations"] = total_vaccinations;
	
	print(lista_vacinacao[i]["dt_registro"], " | ", lista_vacinacao[i]["total_vaccinations"]);
end