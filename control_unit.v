module ControlUnit (
    input [18:0] instruction,
    output reg [3:0] ALU_Sel,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg Jump,
    output reg Call,
    output reg Ret
);

always @(*) begin
    case (instruction[18:15]) // Opcode is the highest 4 bits
        4'b0000: begin // ADD
            ALU_Sel = 4'b0000;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
            Call = 0;
            Ret = 0;
        end
        4'b0001: begin // SUB
            ALU_Sel = 4'b0001;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
            Call = 0;
            Ret = 0;
        end
        4'b0010: begin // MUL
            ALU_Sel = 4'b0010;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
            Call = 0;
            Ret = 0;
        end
        4'b0011: begin // DIV
            ALU_Sel = 4'b0011;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
            Call = 0;
            Ret = 0;
        end 
        4'b0100: begin// And
            ALU_Sel = 4'b0100;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
            Call = 0;
            Ret = 0;
        end 
        4'b0101: begin// OR
            ALU_Sel = 4'b0101;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
            Call = 0;
            Ret = 0;
        end  
        4'b0110: begin// XOR
            ALU_Sel = 4'b0110;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
            Call = 0;
            Ret = 0;
        end  
        4'b0111: begin// NOT
            ALU_Sel = 4'b0111;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
            Call = 0;
            Ret = 0;
        end   
    endcase
end

endmodule
