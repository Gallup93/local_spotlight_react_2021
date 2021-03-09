import React from "react";
import PropTypes from "prop-types";


class ArtistImage extends React.Component {
  constructor(props){
    super(props)
    var urls = this.props.urls
    var image = urls.toString().split(",")[2]

    this.state = { image: image};
  }


  render() {
    return(
      <div class="artist-image">
        <img src={this.state.image} alt="artist-image"></img>
      </div>
    )
  }
}



export default ArtistImage;
