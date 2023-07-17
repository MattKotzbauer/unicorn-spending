import numpy as np
import tensorflow as tf
import sklearn
from tensorflow import keras
from sklearn.model_selection import train_test_split

def generate_dataset(num_samples):
    np.random.seed(42)
    X = np.random.rand(num_samples, 2)
    y = (X[:, 0] + X[:, 1] > 1).astype(int)  # Simple condition for binary classification
    return X, y

def create_model():
    model = keras.Sequential([
        keras.layers.Dense(16, activation='relu', input_shape=(2,)),
        keras.layers.Dense(8, activation='relu'),
        keras.layers.Dense(1, activation='sigmoid')
    ])
    model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
    return model

def main():
    num_samples = 1000
    X, y = generate_dataset(num_samples)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    model = create_model()
    model.fit(X_train, y_train, epochs=10, batch_size=32, validation_data=(X_test, y_test))
    loss, accuracy = model.evaluate(X_test, y_test)
    print(f"Test Loss: {loss:.4f}, Test Accuracy: {accuracy:.4f}")
    new_data = np.array([[0.8, 0.2], [0.3, 0.7]])
    predictions = model.predict(new_data)
    print("Predictions for new data:")
    for i, prediction in enumerate(predictions):
        print(f"Data {i + 1}: Probability of class 1: {prediction[0]:.4f}, Class: {round(prediction[0])}")

if __name__ == "__main__":
    main()
