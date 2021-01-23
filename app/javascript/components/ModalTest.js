import React from "react";
import Modal from "react-modal";

Modal.setAppElement("#root");

export default function App() {
  const [modalIsOpen, setIsOpen] = React.useState(false);

  return (
    <div className="App">
      <button onClick={() => setIsOpen(true)}>Open Modal</button>
      <Modal isOpen={modalIsOpen}>
        <button onClick={() => setIsOpen(false)}>Close Modal</button>
      </Modal>
    </div>
  );
}