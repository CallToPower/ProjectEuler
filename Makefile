include	Make/Makefile.options

OBJS = $(OBJ)Problem1 $(OBJ)Problem2 $(OBJ)Problem3 \
	$(OBJ)Problem4 $(OBJ)Problem5 $(OBJ)Problem6 \
	$(OBJ)Problem7 $(OBJ)Problem8 $(OBJ)Problem9 \
	$(OBJ)Problem10 $(OBJ)Problem11 $(OBJ)Problem12 \
	$(OBJ)Problem14 $(OBJ)Problem17 $(OBJ)Problem19 \
	$(OBJ)Problem21 $(OBJ)Problem24 $(OBJ)Problem26

all: $(OBJ) $(OBJS)

$(OBJ):
	@mkdir $@

exe: all
	./$(OBJ)Problem1
	./$(OBJ)Problem2
	./$(OBJ)Problem3
	./$(OBJ)Problem4
	./$(OBJ)Problem5
	./$(OBJ)Problem6
	./$(OBJ)Problem7
	./$(OBJ)Problem8
	./$(OBJ)Problem9
	./$(OBJ)Problem10
	./$(OBJ)Problem11
	./$(OBJ)Problem12
	./$(OBJ)Problem14
	./$(OBJ)Problem17
	./$(OBJ)Problem19
	./$(OBJ)Problem21
	./$(OBJ)Problem24
	./$(OBJ)Problem26

$(OBJ)Problem1: $(SRC)Problem1.c
	@$(ECHO) -r "[EXE] Problem 1 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem1.c -o $(OBJ)Problem1

$(OBJ)Problem2: $(SRC)Problem2.c
	@$(ECHO) -r "[EXE] Problem 2 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem2.c -o $(OBJ)Problem2

$(OBJ)Problem3: $(SRC)Problem3.c
	@$(ECHO) -r "[EXE] Problem 3 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem3.c -o $(OBJ)Problem3

$(OBJ)Problem4: $(SRC)Problem4.c
	@$(ECHO) -r "[EXE] Problem 4 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem4.c -o $(OBJ)Problem4

$(OBJ)Problem5: $(SRC)Problem5.c
	@$(ECHO) -r "[EXE] Problem 5 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem5.c -o $(OBJ)Problem5

$(OBJ)Problem6: $(SRC)Problem6.c
	@$(ECHO) -r "[EXE] Problem 6 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem6.c -o $(OBJ)Problem6

$(OBJ)Problem7: $(SRC)Problem7.c
	@$(ECHO) -r "[EXE] Problem 7 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem7.c -o $(OBJ)Problem7

$(OBJ)Problem8: $(SRC)Problem8.c
	@$(ECHO) -r "[EXE] Problem 8 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem8.c -o $(OBJ)Problem8

$(OBJ)Problem9: $(SRC)Problem9.c
	@$(ECHO) -r "[EXE] Problem 9 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem9.c -o $(OBJ)Problem9

$(OBJ)Problem10: $(SRC)Problem10.c
	@$(ECHO) -r "[EXE] Problem 10 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem10.c -o $(OBJ)Problem10

$(OBJ)Problem11: $(SRC)Problem11.c
	@$(ECHO) -r "[EXE] Problem 11 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem11.c -o $(OBJ)Problem11

$(OBJ)Problem12: $(SRC)Problem12.c
	@$(ECHO) -r "[EXE] Problem 12 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem12.c -o $(OBJ)Problem12

$(OBJ)Problem14: $(SRC)Problem14.c
	@$(ECHO) -r "[EXE] Problem 14 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem14.c -o $(OBJ)Problem14

$(OBJ)Problem17: $(SRC)Problem17.c
	@$(ECHO) -r "[EXE] Problem 17 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem17.c -o $(OBJ)Problem17

$(OBJ)Problem19: $(SRC)Problem19.c
	@$(ECHO) -r "[EXE] Problem 19 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem19.c -o $(OBJ)Problem19

$(OBJ)Problem21: $(SRC)Problem21.c
	@$(ECHO) -r "[EXE] Problem 21 in $(OBJ)"
	@$(CCC) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem21.c -o $(OBJ)Problem21

$(OBJ)Problem24: $(SRC)Problem24.cpp
	@$(ECHO) -r "[EXE] Problem 24 in $(OBJ)"
	@$(CPP) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem24.cpp -o $(OBJ)Problem24

$(OBJ)Problem26: $(SRC)Problem26.c
	@$(ECHO) -r "[EXE] Problem 26 in $(OBJ)"
	@$(CPP) $(CCFLAGS) $(LDFLAGS) $(SRC)Problem26.c -o $(OBJ)Problem26

clean:
	@$(ECHO) -b "[CLN] Project Euler executables in $(OBJ)"
	@rm -rf $(OBJ)*

clean_dirs:
	@$(ECHO) -b "[CLN] Project Euler $(OBJ) directory"
	@rm -rf $(OBJ)
