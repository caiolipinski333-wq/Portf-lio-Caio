import java.util.Scanner;

class Cliente {
    private String nome;
    private String cpf;
    private String endereco;
    private String telefone;
    private String tipoCarro;

    public Cliente(String nome, String cpf, String endereco, String telefone, String tipoCarro) {
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
        this.tipoCarro = tipoCarro;
    }
     String getNome() {
        return nome;
    }
    String getTipoCarro() {
        return tipoCarro;
    }
    public String toString() {
        return "Cliente: " + nome + "\nCPF: " + cpf + "\nEndereço: " + endereco + "\nTelefone: " + telefone
                + "\nTipo de Carro: " + tipoCarro;
    }
}

class EstoqueCarros {
    private static int carrosNovosDisponiveis = 15;
    private static int carrosUsadosDisponiveis = 30;

    public static boolean comprarCarroNovo() {
        if (carrosNovosDisponiveis > 0) {
            carrosNovosDisponiveis--;
            return true;
        }

        return false;
    }

    public static boolean comprarCarroUsado() {
        if (carrosUsadosDisponiveis > 0) {
            carrosUsadosDisponiveis--;
            return true;
        }
        return false;
    }
}

class SistemaCadastroClientes {
    private static Scanner scanner = new Scanner(System.in);

    private static Cliente cadastrarCliente() {
        System.out.print("Digite o nome do cliente: ");
        String nome = scanner.nextLine();

        System.out.print("Digite o CPF do cliente: ");
        String cpf = scanner.nextLine();

        System.out.print("Digite o endereço do cliente: ");
        String endereco = scanner.nextLine();

        System.out.print("Digite o telefone do cliente: ");
        String telefone = scanner.nextLine();

        System.out.print("Escolha o tipo de carro (Digite 'novo' para Novo, 'usado' para Usado): ");
        String tipoCarro = scanner.nextLine().toLowerCase();

        if (("novo".equals(tipoCarro) && EstoqueCarros.comprarCarroNovo()) ||
                ("usado".equals(tipoCarro) && EstoqueCarros.comprarCarroUsado())) {
            return new Cliente(nome, cpf, endereco, telefone, tipoCarro);
        } else {
            System.out.println("Estoque de carros esgotado para o tipo selecionado. Cadastro não concluído.");
            return null;
        }
    }
    private static void exibirMensagemBônus(Cliente cliente) {
        if (cliente != null) {
            int bonus = "novo".equals(cliente.getTipoCarro()) ? 9000 : 3000;
            System.out.println("Parabéns, " + cliente.getNome() + "! Você ganhou um bônus de R$ " + bonus
                    + " para a compra do seu carro " + cliente.getTipoCarro() + ".");
        }
    }

    public static void main(String[] args) {
        System.out.println(" Cadastro de Novos Clientes");
        Cliente novoCliente = cadastrarCliente();
        exibirMensagemBônus(novoCliente);
    }
}


