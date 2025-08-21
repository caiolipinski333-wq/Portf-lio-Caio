import java.util.Scanner;

public class Planetario {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String[] planetas = {
                "Mercúrio", "Vênus", "Terra", "Marte", "Júpiter", "Saturno", "Urano", "Netuno", "Plutão"
        };

        String[] informacoes = {
                "Tamanho: 4.879 km de diâmetro\nDistância do Sol: 57.9 milhões de km\nNúmero de Luas: 0",
                "Tamanho: 12.104 km de diâmetro\nDistância do Sol: 108.2 milhões de km\nNúmero de Luas: 0",
                "Tamanho: 12.742 km de diâmetro\nDistância do Sol: 149.6 milhões de km\nNúmero de Luas: 1 (Lua)",
                "Tamanho: 6.779 km de diâmetro\nDistância do Sol: 227.9 milhões de km\nNúmero de Luas: 2",
                "Tamanho: 139.822 km de diâmetro\nDistância do Sol: 778.3 milhões de km\nNúmero de Luas: 79",
                "Tamanho: 116.464 km de diâmetro\nDistância do Sol: 1.427 bilhões de km\nNúmero de Luas: 83",
                "Tamanho: 50.724 km de diâmetro\nDistância do Sol: 2.871 bilhões de km\nNúmero de Luas: 27",
                "Tamanho: 49.244 km de diâmetro\nDistância do Sol: 4.495 bilhões de km\nNúmero de Luas: 14",
                "Tamanho:  2.370 km de diâmetro\nDistâncio do sol: 5.913 bilhões de km\nNúmero de luas: 5"
        };

        while (true) {
            System.out.println("Bem-vindo ao Planetário!");
            System.out.println("Digite o número do planeta que deseja saber as informações (1-9) ");
            int escolha = scanner.nextInt();

            if (escolha >= 1 && escolha <= 10) {
                int indice = escolha - 1;
                System.out.println("Informações sobre " + planetas[indice] + ":");
                System.out.println(informacoes[indice]);
                break;


            }
        }


    }
}