/* 
Author: Claire Huo

To check specific instructions in output of objdump.
Use check.sh to compile and run!!!
*/
#include <iostream>
#include <istream>
#include <fstream>
#include <sstream>
#include <string>

using namespace std;
enum Hardword{ARGNUM = 2, WRONGARGS = -1, FILENAME =1};

void usageMsg(){
    cout << "Icorrect arg nums." << endl;
}

int main(int argc, char const *argv[])
{
    cout << "Start Scanning..." << endl;
    if(argc < ARGNUM || argc > ARGNUM){
        usageMsg();
        return WRONGARGS;
    }
    string filename = argv[FILENAME];
    fstream file;
    file.open(filename);
    string line;
    string word;

    int return_num = 0;
    int ict_num = 0;
    int read_num = 0;
    int write_num = 0;

    if(file.is_open()){
        while(getline(file, line)){
            stringstream iss(line);
            // Check Returns:
            if(line.find("bx") != string::npos && line.find("ir") != string::npos){
                return_num++;
            }else if(line.find("pop") != string::npos && line.find("pc") != string::npos){
                return_num++;
            }else if(line.find("orr") != string::npos){
                return_num++;
            }else if(line.find("mov") != string::npos && line.find("pc") != string::npos && line.find("lr") != string::npos){
                return_num++;
            }

            // Check ICT:
            if(line.find("blx") != string::npos && line.find("r") != string::npos){
                ict_num++;
            }
            while(iss >> word){
                // Check Read:
                if(word.find("ldr") != string::npos){
                    read_num++;
                }else if(word.find("ldrge") != string::npos){
                    read_num++;
                }else if(word.find("ldrbtvc") != string::npos){
                    read_num++;
                }else if(word.find("ldrbvs") != string::npos){
                    read_num++;
                }else if(word.find("ldrb") != string::npos){
                    read_num++;
                }

                // Check Write:
                if(word.find("str") != string::npos){
                    write_num++;
                }else if(word.find("strb") != string::npos){
                    write_num++;
                }else if(word.find("strbvs") != string::npos){
                    write_num++;
                }else if(word.find("strbtvc") != string::npos){
                    write_num++;
                }else if(word.find("strbvc") != string::npos){
                    write_num++;
                }else if(word.find("strbne") != string::npos){
                    write_num++;
                }else if(word.find("strmi") != string::npos){
                    write_num++;
                }else if(word.find("strtcc") != string::npos){
                    write_num++;
                }else if(word.find("strheq") != string::npos){
                    write_num++;
                }
            }
        }
    }
    cout << "End scanning" << endl;
    cout << "ICT:  " << ict_num << endl;
    cout << "Returns:  " << return_num << endl;
    cout << "Write:  " << write_num << endl;
    cout << "Read:  " << read_num << endl;
    
    return 0;
}

