from mrjob.job import MRJob
from mrjob.step import MRStep
class MyMRJobClass(MRJob):
	def mapper(self,_,line):
		data = line.split(',')
		playerID = data[0]
		yield playerID,None

	def reducer1(self,key, list_of_values):
		yield None,key
	def reducer2(self,key,list_of_values):
		retun len(list_of_values)

	def steps(self):
		retun [MRStep(mapper = self.mapper, reducer = self.reducer1),
				MRStep(reducer=self.reducer2)]

if __name__ == '__main__':
	MyMRJobClass.run()