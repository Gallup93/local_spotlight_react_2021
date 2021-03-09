import React from "react";
import PropTypes from "prop-types";

class AlbumContainer extends React.Component {
  constructor(props){
    super(props);
    var image = this.props.album.images.toString().split("=>")[5].split(",")[0].replace(/\"/g, "")
    this.state = { album: this.props.album, image: image};
  }

  render(){
    return(
      <div class="album-container" key={`album-${this.state.album.id}`}>
        {this.state.album.name} ({this.state.album.release_date.substring(0,4)})<br></br>
        <img src={this.state.image} alt="album-image"></img>
      </div>
    )
  }
}

export default AlbumContainer
