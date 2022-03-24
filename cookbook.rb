#constantes em Ruby são com letras maiúsculas
INSERIR_RECEITA = 1
VISUALIZAR_RECEITA = 2
BUSCAR = 3
SAIR = 4

def bemvindo()
    puts "Bem-vindo ao CookBook, sua rede social de receitas"
end

def menu()
    puts
    puts "[#{INSERIR_RECEITA}] Cadastrar nova receita"
    puts "[#{VISUALIZAR_RECEITA}] Ver receitas cadastradas"
    puts "[#{BUSCAR}] Buscar receita"
    puts "[#{SAIR}] Sair"
    puts
    print "Escolha uma opção: " #print mantem o sensor na mesma linha
    return gets.to_i() #transforma em int 
end

def inserir_receita(receita)
    puts "Digite o nome da receita: "
    nome_receita = gets.chomp
    puts "Digite o tipo da receita: "
    tipo_receita = gets.chomp
    receita << {Nome: nome_receita, Tipo: tipo_receita}
    puts
    puts "Receita #{nome_receita} cadastrada com sucesso!"
    puts
end

def imprimir_receita(receita)
    if receita.empty?
        puts "Nenhuma receita cadastrada."
    else
        puts "=========RECEITAS CADASTRADAS========="
        receita.each do |receita|
            puts "#{receita[:Nome]} - #{receita[:Tipo]}"
        end
        puts
    end
end

def buscar_receita(receita)

    if receita.empty?
        puts "***NENHUM REGISTRO***"
    else
        puts "Qual receita deseja buscar?"
        busca = gets.chomp
        encontrado = 0
        receita.each do |r|
            if (busca == r[:Nome])
                puts
                puts "***ENCONTRADO***"
                puts "#{r[:Nome]} - #{r[:Tipo]}"
                return encontrado = 1
            end               
        end
        if (encontrado = 0)
            puts "***NÃO ENCONTRADO***"   
        end
    end
end

bemvindo()

receita = [] #cada índice do array será um hash

opcao = menu()

while (opcao != SAIR) do
    if (opcao == INSERIR_RECEITA)
        inserir_receita(receita)
    elsif (opcao == VISUALIZAR_RECEITA)
        imprimir_receita(receita)
    elsif (opcao == BUSCAR)
        buscar_receita(receita)
    else
        puts
        puts "Opção inválida"
        puts
    end

    opcao = menu()
end

puts
puts "Obrigado por usar o CookBook!"