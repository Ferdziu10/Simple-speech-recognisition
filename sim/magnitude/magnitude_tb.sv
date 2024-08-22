module magnitude_tb;

    // Deklaracja sygnałów
    logic [15:0] real_part;
    logic [15:0] imag_part;
    logic [31:0] magnitude;

    // Instancja testowanego modułu
    magnitude uut (
        .real_part(real_part),
        .imag_part(imag_part),
        .magnitude(magnitude)
    );

    // Procedura testowa
    initial begin
        // Test 1: Część rzeczywista i urojona to 0 (oczekiwany wynik: 0)
        real_part = 16'h0000;
        imag_part = 16'h0000;
        #10;  // Czekamy 10 jednostek czasu
        $display("Test 1: real_part=0x%h, imag_part=0x%h, magnitude=0x%h", real_part, imag_part, magnitude);

        // Test 2: Część rzeczywista to 3, część urojona to 4 (oczekiwany wynik: 5)
        real_part = 16'h0003;
        imag_part = 16'h0004;
        #10;  // Czekamy 10 jednostek czasu
        $display("Test 2: real_part=0x%h, imag_part=0x%h, magnitude=0x%h", real_part, imag_part, magnitude);

        // Test 3: Część rzeczywista to 3000, część urojona to 4000 (oczekiwany wynik: około 5000)
        real_part = 16'h0BB8;  // 3000 w systemie szesnastkowym
        imag_part = 16'h0FA0;  // 4000 w systemie szesnastkowym
        #10;  // Czekamy 10 jednostek czasu
        $display("Test 3: real_part=0x%h, imag_part=0x%h, magnitude=0x%h", real_part, imag_part, magnitude);

        // Test 4: Część rzeczywista to 16383, część urojona to 16383 (oczekiwany wynik: około 23169)
        real_part = 16'h3FFF;  // 16383 w systemie szesnastkowym
        imag_part = 16'h3FFF;  // 16383 w systemie szesnastkowym
        #10;  // Czekamy 10 jednostek czasu
        $display("Test 4: real_part=0x%h, imag_part=0x%h, magnitude=0x%h", real_part, imag_part, magnitude);

        // Test 5: Część rzeczywista to 65535, część urojona to 0 (oczekiwany wynik: około 65535)
        real_part = 16'hFFFF;  // 65535 w systemie szesnastkowym
        imag_part = 16'h0000;  // 0 w systemie szesnastkowym
        #10;  // Czekamy 10 jednostek czasu
        $display("Test 5: real_part=0x%h, imag_part=0x%h, magnitude=0x%h", real_part, imag_part, magnitude);

        // Zakończenie symulacji
        $stop;
    end

endmodule
