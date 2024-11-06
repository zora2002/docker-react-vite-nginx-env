import './App.css'

function App() {

  return (
    <>
      <p>VITE_TITLE</p>
      <h1>{import.meta.env.VITE_TITLE}</h1>
      <p>VITE_API_URL</p>
      <a href={import.meta.env.VITE_API_URL}>{import.meta.env.VITE_API_URL}</a>
    </>
  )
}

export default App
