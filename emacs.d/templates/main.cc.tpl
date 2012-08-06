
#include <iostream>

using std::cout;
using std::endl;
using std::cin;

bool usage(int argc, char ** argv)
{
  if (argc != 1)
  {
    std::cout << argv[0] << std::endl;
    return true;
  }
  return false;
}

int main(int argc, char ** argv)
{
  if (usage(argc, argv))
    return 1;

  (>>>POINT<<<)
}
