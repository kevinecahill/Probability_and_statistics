#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <valarray>

using namespace std;

// Fills the given val array with random numbers betwen 0 and 1
void rand01(valarray<double>& val)
{
  // Records the size
  unsigned int size = val.size();

  // Loops through the size
  unsigned int i=0;
  for (i=0; i<size; i++)
  {  
    // Generates a random number between 0 and 1
    val[i] = static_cast<double>(rand()) / RAND_MAX;
  }
}

void clt ()
{
  // Declares local constants
  const int PLOT_SIZE      = 100;
  const int LOOP_CALC_ITR  = 10000000;
  const double ONE_THIRD   = 1.0 / 3.0;

  // Inits local variables
  double y=0;
  int i=0, j=0, n=0;

  // Gets the value of J
  cout << "What is J? ";
  cin >> j;

  // Bases the vec size on J
  const int VEC_SIZE = static_cast<int>(pow(2.0,j));

  // Inits vectors
  valarray<double> plot(PLOT_SIZE);
  valarray<double> rplot(PLOT_SIZE);
  valarray<double> r(VEC_SIZE);

  // Seeds random number generator
  srand ( time(NULL) );

  // Performs the calculations
  for (i=0; i<LOOP_CALC_ITR; i++)
  {
    rand01(r);
    r = pow(r, ONE_THIRD);
    y = r.sum() / VEC_SIZE;
    n = static_cast<int>(100 * y);
    plot[n]++;
  }

  // Normalizes the RPLOT
  rplot = plot * (100.0 / plot.sum());

  // Opens a data file
  ostringstream fileName;
  fileName << "plot_" << j << ".txt";
  ofstream fileHandle;
  fileHandle.open (fileName.str().c_str());

  // Sets precision
  fileHandle.setf(ios::fixed,ios::floatfield);
  fileHandle.precision(7);

  // Writes the data to a file
  for (i=1; i<=PLOT_SIZE; i++)
  {
    fileHandle << 0.01 * (i - 0.5) << "   " << rplot[i-1] << endl;
  }
  if (1 == j)
  {
    fileHandle << 1 << "   " << 0 << endl;
  }

  // Closes the data file
  fileHandle.close();
}

int main ()
{
  clt();
  
  return 0;
}
