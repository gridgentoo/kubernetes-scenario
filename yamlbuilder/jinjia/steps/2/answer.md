Classification accuracy is a ratio of the number of correct predictions out of all predictions that
were made. It is often presented as a percentage between 0% for the worst possible accuracy
and 100% for the best possible accuracy..
       
<pre class="file" data-filename="classification_accuracy.py" data-target="replace">

# Example of calculating classification accuracy

# Calculate accuracy percentage between two lists
def accuracy_metric(actual, predicted):
	correct = 0
	for i in range(len(actual)):
		if actual[i] == predicted[i]:
			correct += 1
	return correct / float(len(actual)) * 100.0

# Test accuracy
actual = [0,0,0,0,0,1,1,1,1,1]
predicted = [0,1,0,0,0,1,0,1,1,1]
accuracy = accuracy_metric(actual, predicted)
print(accuracy)

</pre>

**Note:** Notice that we use == to compare the equality actual to predicted values. This allows us to compare integers or strings, two main data types that we may choose to use when loading classification data