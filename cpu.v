module CPU (
    input clk,
    input reset
);

reg [18:0] PC;
wire [18:0] instruction;
wire [18:0] Read_Data1, Read_Data2;
wire [18:0] ALU_Result;
wire Zero;
wire [3:0] ALU_Sel;
wire RegWrite, MemRead, MemWrite, Branch, Jump, Call, Ret;

// Instantiate IF Stage
IFStage if_stage(
    .clk(clk),
    .PC(PC),
    .instruction(instruction)
);

// Instantiate Register File
RegFile reg_file(
    .clk(clk),
    .Read_Reg1(instruction[14:11]),
    .Read_Reg2(instruction[10:7]),
    .Write_Reg(instruction[6:3]),
    .Write_Data(ALU_Result),
    .RegWrite(RegWrite),
    .Read_Data1(Read_Data1),
    .Read_Data2(Read_Data2)
);

// Instantiate ALU
ALU alu(
    .A(Read_Data1),
    .B(Read_Data2),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Result),
    .Zero(Zero)
);

// Instantiate Control Unit
ControlUnit control_unit(
    .instruction(instruction),
    .ALU_Sel(ALU_Sel),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .Jump(Jump),
    .Call(Call),
    .Ret(Ret)
);

// Update Program Counter
always @(posedge clk or posedge reset) begin
    if (reset) begin
        PC <= 19'b0;
    end else if (Jump) begin
        PC <= instruction[14:0];
    end else if (Branch && Zero) begin
        PC <= PC + instruction[14:0];
    end else if (Call) begin
        // Save PC + 1 to stack and jump to address
        PC <= instruction[14:0];
    end else if (Ret) begin
        // Return from subroutine
        PC <= PC + 1;
    end else begin
        PC <= PC + 1;
    end
end

endmodule
